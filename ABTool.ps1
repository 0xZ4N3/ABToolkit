function Invoke-ABT{
    Show-Title


    $Options = [ordered]@{
        "l" = New-MenuOption -Name "Listar Bypasses" -Action {Show-Bypass}
        "i" = New-MenuOption -Name "Importar Bypasses" -Action {Import-Bypass}
        "?" = New-MenuOption -Name "Ayuda" -Action {Show-Help}
        }
    Show-Menu -Title "Menu Principal" -Options $Options    
}

function Show-Bypass{

    $BypassList = (Get-Command -Module ABToolBypass | Select-Object -Property Name).Name

    $Options = [ordered]@{}
    $i = 0
    foreach($Bypass in $BypassList){
        $i++
        $BypassData = & $Bypass -Import
        $Name = $BypassData.Name
        $Action = $BypassData.Script
        $Option = New-MenuOption -Name $Name -Action $Action
        $Options.Add("$i",$Option)
    }

    Show-Menu -Title "Lista de Bypass" -Options $Options -Prompt "ABT\Bypass"

}

function Import-Bypass{

    Import-BypassLocally

}

function Import-BypassLocally{
    $path = '.\Bypass\ABToolBypass.psm1'
    if(Test-Path -Path $path -PathType Leaf){
        Import-Module $path
    }
    else{
        Write-Host "NO EXISTE $path"
    }
     
}

function Show-Help {
    
    Write-Host "AYUDA DE LA HERRAMIENTA"

}


function Show-Title{

    Write-Host "AMSI BYPASS" -ForegroundColor Green

}

function Show-Menu{
    param(
        [String] $Title,
        [hashtable] $Options,
        [string] $Prompt = "ABT"
    )
    $back = $false
    while(!$back){
        Write-Host "`n`n$Title`n" -ForegroundColor Yellow


        foreach($Option in $Options.GetEnumerator()){
            $Value = $Option.Value
            $Key = $Option.Key
            $Name = $Option.Value.Name
            Write-Host "$Key) $Name"
        }

        write-host

        $Value = $null
        while($Value.length -eq 0){
            Write-Host "$Prompt> " -NoNewline
            $Value = Read-Host
        }
        

        switch ($Value) {
            "q" { exit }
            "b" { $back = $true }
            Default {
                "Executing $($Options.Get_Item($Value).Name)"
                $Options.Get_Item($Value).Action}
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

