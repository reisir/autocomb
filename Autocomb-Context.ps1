
. .\Context.ps1

# Output file
$out = "@Resources\MainContextMenu.inc"


$loadAll = @{
    Title  = 'Load all combs'
    Action = '[!CommandMeasure PSRM Load]'
}

$unloadAll = @{
    Title  = 'Deactivate all combs'
    Action = '[!CommandMeasure PSRM Unload]'
}

$menu = @(
    $current, $spacer,
    $editVariables, $refreshGroup, $spacer,
    $loadAll, $unloadAll, $spacer
    $skinmenu, $unloadSelf
)

Write-Menu
