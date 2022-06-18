function Invoke-PSDowngrade{

    [CmdletBinding()]
    Param(
    [string] $Get,
    [switch] $Import,
    [switch] $Run,
    [switch] $Help
    )

    
    $Bypass = New-Object -TypeName PSObject
    $Title = "Downgrade de PowerShell"
    $Description = "Este bypass consiste en usar "
    $Script = {powershell -v 2}



    $Bypass | Add-Member -MemberType NoteProperty -Name "Title" -Value $Title
    $Bypass | Add-Member -MemberType NoteProperty -Name "Description" -Value $Description
    $Bypass | Add-Member -MemberType NoteProperty -Name "Script" -Value $Script

    $Bypass | Add-Member -MemberType ScriptMethod -Name ShowTitle -Value {Write-Host $Bypass.Title}
    $Bypass | Add-Member -MemberType ScriptMethod -Name ShowDescription -Value {Write-Host $Bypass.Description}
    $Bypass | Add-Member -MemberType ScriptMethod -Name ShowScript -Value {Write-Host $Bypass.Script}
    $Bypass | Add-Member -MemberType ScriptMethod -Name RunScript -Value {& $Bypass.Script}



    if($Help){
        Write-Host "Help menu"
        return
    }


    if($Get.Length -ne 0)
    {
        if($Get -eq "All"){
            $Bypass.PSObject.Properties | ForEach-Object{

                $name = $_.Name 
                $value = $_.value
                Write-Host "`n${name}: `n$value`n"
                

            }
        }else{
            Write-Output $Bypass | Select-Object -Property $Get
        }
    }

    if($Import){
        return $Bypass
    }


}