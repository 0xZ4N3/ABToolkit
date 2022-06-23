

$path = Split-Path $MyInvocation.MyCommand.Definition -Parent
$bypasses = Get-ChildItem -Recurse $path *.ps1
foreach ($bypassScript in $bypasses) {
     Import-Module $bypassScript.FullName
}
