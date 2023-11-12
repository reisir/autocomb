$RootConfigPath = "$($RmApi.VariableStr("ROOTCONFIGPATH"))"
$ResourcesPath = "$($RootConfigPath)@Resources\"
$LinksPath = "$($ResourcesPath)Links\"
$IconsPath = "$($ResourcesPath)Icons\"

function Get-StartMenuItems {
    Write-Host "Getting start menu items!"
    $StartMenu = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
    return Get-ChildItem -Path $StartMenu -Recurse -Include "*.lnk"
}

function FileChoose {
    param (
        [Parameter(ValueFromPipeline, Mandatory, Position = 1)]
        [string]
        $Path
    )
    # Write-Host "Calling FileChoose!"
    $RmApi.Bang("[!CommandMeasure FileChoose `"Resolve 1 $Path`"]")
}

function Empty {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch]
        $SkipRefresh
    )

    # Remove comb folders
    Get-ChildItem -Path "$($RootConfigPath)*" -Directory | Where-Object -FilterScript { $_.Name -notlike "@Resources" } | Remove-Item -Recurse -Force
    # Remove icons and links
    Get-ChildItem -Path "$($LinksPath)*" -File -Include "*.lnk" | Remove-Item
    Get-ChildItem -Path "$($IconsPath)*" -File -Include "*.png" -Exclude "folder.png" | Remove-Item

    if (!$SkipRefresh) {
        $RmApi.Bang("[!RefreshApp]")
    }
}

function New-Comb {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileInfo]
        $Item,
        [Parameter()]
        [string]
        $Icon
    )

    $SkinPath = "$($RootConfigPath)$($Item.BaseName)\"
    if (!(Test-Path $SkinPath)) {
        New-Item -ItemType Directory -Path $SkinPath
        @"
[Rainmeter]
@IncludeCommon=#@#Common.inc

[Base]
LeftMouseUpAction=["#@#Links\$($Item.Name)"]

[Icon]
ImageName=#@#Icons\$((Get-ChildItem -Path $Icon).Name)

"@ | Out-File -FilePath "$($SkinPath)$($Item.BaseName).ini"
    }
}

function Autocomb {
    # Unpause Autocomb animation
    $RmApi.Bang("[!UnpauseMeasure MeasureHypersphube]")

    # Get items
    $Items = Get-StartMenuItems

    # Clear items
    Empty -SkipRefresh

    # Generate combs
    $Items | ForEach-Object {
        # Skip uninstalls
        if ($_.Name -like "Uninstall*") { return }
        # Call FileChoose to copy icon
        FileChoose $_.FullName
        # Copy the Start Menu .lnk file
        Copy-Item -Path $_.FullName -Destination "$($LinksPath)$($_.Name)" -Force
        # Get the Icon name
        $Icon = $RmApi.MeasureStr('FileChoose')
        # If the Icon is from an .exe, create a comb for it
        if ($Icon -match "exe\.png$") {
            New-Comb -Item $_ -Icon $Icon
        }
        # The loop runs in the UI thread, force UI to update :3
        $RmApi.Bang("[!Update][!Redraw]")
    }

    # Refresh Rainmeter
    $RmApi.Bang('[!RefreshApp]')
}

function Load {
    # Get items
    $Items = Get-StartMenuItems
    $Bangs = ""
    $Items | ForEach-Object {
        $SkinPath = "$($RootConfigPath)$($_.BaseName)\"
        if (Test-Path $SkinPath) {
            $Bangs = $Bangs + "[!ActivateConfig `"Autocomb\$($_.BaseName)`"]"
        }
    }
    Write-Host $Bangs
    $RmApi.Bang($Bangs)
}

function Unload {
    $RmApi.Bang("[!DeactivateConfigGroup Autocomb][!ActivateConfig Autocomb]")
}

function Update {
    return $True
}
