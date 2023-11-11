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
DefaultUpdateDivider=-1
LeftMouseUpAction=["#@#Links\$($Item.Name)"]

[Variables]
Scale=1

[\]
@IncludeBase=#@#Base.inc

[Icon]
Meter=Image
ImageName=#@#Icons\$((Get-ChildItem -Path $Icon).Name)

"@ | Out-File -FilePath "$($SkinPath)$($Item.BaseName).ini"
    }
}

function Autocomb {
    $Items = Get-StartMenuItems

    $Items | % { 
        FileChoose $_.FullName
        Copy-Item -Path $_.FullName -Destination "$($LinksPath)$($_.Name)" -Force
        $Icon = $RmApi.MeasureStr('FileChoose')
        if ($Icon -match "exe\.png$") {
            New-Comb -Item $_ -Icon $Icon
        }
    }
    $RmApi.Bang('[!RefreshApp]')
}

function Update {    
    return $True
}
