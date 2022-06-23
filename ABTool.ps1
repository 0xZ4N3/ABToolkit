function Invoke-ABT{



    Show-Title
    
    

    $Options = @(
        New-MenuOption -Name "Test" -Action {Write-Host "Funciona!"}
        New-MenuOption -Name "Test2" -Action {Write-Host "Funciona2!"}
        )
    #Show-Menu -Title "Menu Principal" -Options @{"Option1"={Write-Host "1!!"};"Option2"={Write-Host "2!!"}}
    Show-Menu -Title "Menu Principal" -Options $Options



}

function Show-Title{

    Write-Host "AMSI BYPASS" -ForegroundColor Green

}
function Show-Menu{
    param(
        [String] $Title,
        [PSObject[]] $Options
    )
    $exit = $false
    while(!$exit){
        Write-Host "$Title`n" -ForegroundColor Yellow

        foreach($Option in $Options){
            $Name = $Option.Name
            Write-Host "$($Options.IndexOf($Option) + 1)`)  $Name"
        }

        Write-Host "ABT> " -NoNewline
        $Value = Read-Host
        
        if($Value -eq 'b'){
            break
        }
            

        ($Options[$Value - 1].Action)

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