function KillThatProcess {
    param(
    [Parameter()]
    [string] $processname
    )  

    $DestroyProcess = Get-Process -Name $processname 

    if ($processname -eq $null)
    {
        Read-Host "There are 0 processes with the name $processname, please start a new instance of $processname"       
    }

    $count = $DestroyProcess.Count 

    $str = Read-Host "There are $count processes with the name $processname, proceed? Y/N"       
    
     if($str.ToLower() -eq "y")
    {
       $DestroyProcess | spps
        Write-Host "The operation was successful, press Enter to continue"
        
    }
    
    Else{

        Write-Host -NoNewline -BackgroundColor Red -ForegroundColor Black "The operation to shut down $processname failed, press Enter to continue."
        
    }
}
KillThatProcess("notepad")

Function Bamboozle
{   param(
    [Parameter()]
    [string] $FilePath = (Set-Location '.'))

    $randomLetter = -join(("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z") | Get-Random -Count 1 | % {[char]$_})   
    Write-Host -NoNewLine -BackgroundColor Red -ForegroundColor White 'Finland has recently closed all its borders. No one will be crossing the finish line in the future: ' $randomLetter
    
   
    $file = gci -af -Path $FilePath -Filter "*$randomLetter*"

    foreach ($_ in $file)
    {
       $_ | Remove-Item -WhatIf  
       
    }
    
    if ($file -eq $null)
    {
         Write-Host 'There is nothing here, just like our hope'
         
    }     

}
Bamboozle

