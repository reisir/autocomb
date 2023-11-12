# Skin information
$SkinName = "Autocomb"
$ROOTCONFIG = $SkinName
$editVariablesFile = "#@#Variables.inc"

# Script settings

# Output file
$out = "@Resources\ContextMenu.inc"

# Are you using a language file? 
# If true, context menu titles will use __language variables 
$useLanguage = $False

# Common context menu items

$spacer = @{
    Title  = '-'
    Action = ''
}

$autocomb = @{
    Title = 'Autocomb'
    Action = '[!ActivateConfig Autocomb]'
}

$current = @{
    Title  = '#CURRENTCONFIG#'
    Action = '["#CURRENTPATH#"]'
}

$unloadSelf = @{
    Title  = 'Unload skin'
    Action = '[!DeactivateConfig]'
}

$editVariables = @{ 
    Title  = if ($useLanguage) { '#__EditVariables#' } else { 'Edit variables' }
    Action = "[`"#CONFIGEDITOR#`" `"$editVariablesFile`"]"
}

$refreshGroup = @{
    Title  = if ($useLanguage) { '#__RefreshGroup#' } else { "Refresh $SkinName" }
    Action = "[!RefreshGroup $ROOTCONFIG]"
}

$skinmenu = @{    
    Title  = if ($useLanguage) { '#__SkinMenu#' } else { 'Open skin menu' }
    Action = '[!SkinMenu]'
}

$centerHorizontal = @{
    Title  = if ($useLanguage) { '#__CenterHorizontal#' } else { 'Center horizontally' }
    Action = '[!SetWindowPosition "50%" "[#CURRENTCONFIGY]" "50%" "0%"]'
}

$centerVertical = @{
    Title  = if ($useLanguage) { '#__CenterVertical#' } else { 'Center vertically' }
    Action = '[!SetWindowPosition "([#CURRENTCONFIGX] + ([#CURRENTCONFIGWIDTH] / 2))" "50%" "50%" "50%"]'
}

function ToggleVariable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position, ValueFromPipeline)]
        [string]
        $VariableName
    )

    return @{
        Title  = if ($useLanguage) { "#__Toggle$VariableName#" } else { "Toggle $VariableName" } 
        Action = "[!SetVariable `"$VariableName`" `"([#$VariableName] = 1 ? 0 : 1)`"][!WriteKeyValue Variables `"$VariableName`" [#$VariableName] `"$editVariablesFile`"][!Refresh]"
    }
}

$menu = @(
    $autocomb, $spacer,
    $editVariables, $refreshGroup, $spacer,
    $skinmenu, $unloadSelf
)

function Write-Menu {
    $output = "[Rainmeter]`nRightMouseUpAction=[!SkinCustomMenu]`nGroup=$SkinName`n"
    $count = ""

    $menu | % {
        $output += @"
ContextTitle$($count)=$($_.Title)
ContextAction$($count)=$($_.Action)

"@
        $count = 1 + $count
        if ($count -eq 1) { $count++ }
    }

    $output  | Out-File -FilePath $out 
}

Write-Menu
