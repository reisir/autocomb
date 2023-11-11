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
LeftMouseUpAction=["#@#Links\$($Item.Name)"]
@IncludeCommon=#@#Common.inc

[Icon]
ImageName=#@#Icons\$((Get-ChildItem -Path $Icon).Name)

"@ | Out-File -FilePath "$($SkinPath)$($Item.BaseName).ini"
    }
}

function Autocomb {
    # Clear items
    Empty -SkipRefresh

    # Get items
    $Items = Get-StartMenuItems

    # Generate combs
    $Items | % { 
        FileChoose $_.FullName
        Copy-Item -Path $_.FullName -Destination "$($LinksPath)$($_.Name)" -Force
        $Icon = $RmApi.MeasureStr('FileChoose')
        if ($Icon -match "exe\.png$") {
            New-Comb -Item $_ -Icon $Icon
        }
    }

    # Refresh Rainmeter
    $RmApi.Bang('[!RefreshApp]')
}

function Update {
    return $True
}
