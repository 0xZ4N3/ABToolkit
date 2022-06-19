function Invoke-PSDowngrade{

    [CmdletBinding()]
    Param(
    [string] $Get,
    [switch] $Run,
    [switch] $Import
    )
    
    $Bypass = New-Object -TypeName PSObject
    $Name = "Memory Patching (Ofuscated)"
    $Description = "Este bypass es una versión modificada de la tecnica de parcheo de 4ms1ScanBuffer() en memoria ofuscada de tal forma que no es detectada por Windows Defender"
    $Script = {
        
    }


    $Bypass | Add-Member -MemberType NoteProperty -Name "Name" -Value $Name
    $Bypass | Add-Member -MemberType NoteProperty -Name "Description" -Value $Description
    $Bypass | Add-Member -MemberType NoteProperty -Name "Script" -Value $Script
    $Bypass | Add-Member -MemberType ScriptMethod -Name RunScript -Value {& $Bypass.Script}


    if($Run){
        $Bypass.RunScript()
    }

    if($Import){
        return $Bypass
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
        return
    }

    $Name
    Write-Host "`n=========Descripción=========="
    $Description
    Write-Host "`n===========Script============="
    $Script

}