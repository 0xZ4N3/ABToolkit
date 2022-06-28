function Invoke-ABT{
    Show-Title

    Show-Help

    $Options = [ordered]@{
        "l" = New-MenuOption -Name "Listar Bypasses" -Action {Show-AllBypass}
        "i" = New-MenuOption -Name "Importar Bypasses" -Action {Import-Bypass}
        "?" = New-MenuOption -Name "Ayuda" -Action {Show-Help}
        }
    Show-Menu -Title "Menu Principal" -Options $Options    
}

function Show-AllBypass{

    $BypassList = (Get-Command -Module ABToolBypass | Select-Object -Property Name).Name

    $Options = [ordered]@{}
    $i = 0
    foreach($Bypass in $BypassList){
        $i++
        $Name = $Bypass
        $Action = "Show-Bypass -Bypass $Bypass"
        $Action = [scriptblock]::Create($Action)
        $Option = New-MenuOption -Name $Name -Action $Action
        $Options.Add("$i",$Option)
    }
    Show-Menu -Title "Lista de Bypass" -Options $Options -Prompt "ABT\Bypass"
}

function Show-Bypass {
    param (
        $Bypass
    )

    $BypassData = & $Bypass -Import
    $ShowInfo = [scriptblock]::Create("Write-Host; $Bypass -Info")
    $ShowCode = [scriptblock]::Create("Write-Host; $Bypass -Code")
    $Execute = [scriptblock]::Create("$Bypass -Run")

    $Options = [ordered]@{
        "i" = New-MenuOption -Name "Información del bypass" -Action $ShowInfo
        "c" = New-MenuOption -Name "Mostrar código del bypass" -Action $ShowCode
        "e" = New-MenuOption -Name "Ejecutar bypass" -Action $Execute
    }

    Show-Menu -Title $BypassData.Name -Options $Options -Prompt "ABT\Bypass\$Bypass"
}

function Import-Bypass{

    Import-BypassLocally
    $BypassList = (Get-Command -Module ABToolBypass | Select-Object -Property Name).Name
    Write-Host "`nSe han importado los siguientes bypass: $BypassList`n"

}

function Import-BypassLocally{
    $path = '.\Bypass\ABToolBypass.psm1'
    if(Test-Path -Path $path -PathType Leaf){
        Import-Module $path
    }
    else{
        Write-Host "No se encuentra $path" -ForegroundColor Red
    }
     
}

function Show-Help {
    
    $Ayuda = @"

AYUDA
Para seleccionar una opción es necesario escribir su clave (caracter o numero situado a la izquiera) y presionar Enter
De forma adicional a las opciones mostradas por pantalla, exiten las siguientes:

"@

    $HelpOptions = [ordered]@{
        "[q,b]" = "Retroceder/Salir del menu actual"
        "?" = "Mostrar ayuda"
        "clear" = "Limpiar la terminal"
        "home" = "Volver al menu principal"
    } 

    Write-Host $Ayuda -ForegroundColor Magenta

    foreach($HelpOption in $HelpOptions.GetEnumerator()){
        $HelpKey = $HelpOption.Key
        $HelpValue = $HelpOption.Value
        Write-Host "$HelpKey" -NoNewline -ForegroundColor DarkMagenta
        Write-Host "`t`t-->`t`t" -NoNewline -ForegroundColor Gray
        Write-Host $HelpValue -ForegroundColor Magenta
    }


    

}


function Show-Title{

$Title = @"


 ________  ________  _________  ________  ________  ___          
|\   __  \|\   __  \|\___   ___\\   __  \|\   __  \|\  \         
\ \  \|\  \ \  \|\ /\|___ \  \_\ \  \|\  \ \  \|\  \ \  \        
 \ \   __  \ \   __  \   \ \  \ \ \  \\\  \ \  \\\  \ \  \       
  \ \  \ \  \ \  \|\  \   \ \  \ \ \  \\\  \ \  \\\  \ \  \____  
   \ \__\ \__\ \_______\   \ \__\ \ \_______\ \_______\ \_______\
    \|__|\|__|\|_______|    \|__|  \|_______|\|_______|\|_______|
                                                                 
Tool: ABTool (AMSI Bypass Tool)                                                             
Author: Sergio Corral
GitHub: https://github.com/0xZ4N3/AmsiBypassAlpha
Version: 0.1

"@




    Write-Host $Title -ForegroundColor Green

}

function Show-Menu{
    param(
        [String] $Title,
        [System.Collections.Specialized.OrderedDictionary] $Options,
        [string] $Prompt = "ABT"
    )
    $Selected = "q"
    while($true){
        Write-Host "`n`n$Title" -ForegroundColor Yellow
        Write-Host $("-" * $Title.Length) -ForegroundColor Yellow
        Write-Host

        if($Options.count -eq 0){
            Write-Host "`nNo se cargaron elementos`n" -ForegroundColor Red
        }

        foreach($Option in $Options.GetEnumerator()){
            $Key = $Option.Key
            $Name = $Option.Value.Name
            Write-Host "$Key) " -NoNewline -ForegroundColor DarkCyan
            Write-Host $Name
        }

        write-host

        
        if($null -eq $Selected){
            Write-Host "No se reconoce la opción: $Value" -ForegroundColor Red
            Write-Host
        }

        $Value = $null
        while($Value.length -eq 0){
            Write-Host "$Prompt> " -NoNewline -ForegroundColor DarkCyan
            $Value = Read-Host
        }
        

        switch ($Value) {
            "q" { exit }
            "b" { exit }
            "?" {Show-Help}
            "clear" {Clear-Host}
            "home" {Invoke-ABT}
            Default {
                $Selected = $Options.Get_Item($Value)
                $Selected.Action}
        }



        
        
        

        
    }
}

Function New-MenuOption{
    param(
        [String] $Name,
        [ScriptBlock] $Action
    )

    $MenuOption = New-Object -TypeName PSObject

    $MenuOption | Add-Member -MemberType NoteProperty -Name "Name" -Value $Name
    $MenuOption | Add-Member -MemberType ScriptProperty -Name "Action" -Value $Action

    return $MenuOption
}

