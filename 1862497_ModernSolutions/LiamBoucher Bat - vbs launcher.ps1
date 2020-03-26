##Main

Write-Host "What Function do you want?"
Write-Host "1. KillThatProccess or 2. Bamboozle"

$choice = Read-Host
$path = Get-Location

switch($choice){

    "1"{
    $proccessName = (Read-Host -Prompt "What Process would you like to kill?")
        KillThatProcess($proccessName)
    }

    "2"{
        $path = Read-Host "What is the file path you want to go to?"
        Bamboozle($path)
    }
}


Function KillThatProcess([string] $processName) {
    $procs = Get-Process $processName

    $userNum = Read-Host "There are $($procs.Count) Processes with that name $($processName), proceed? Y/N"

    if($userNum -ne "y") {

        Write-Host -ForegroundColor Black -BackgroundColor Red "You did not confirm - no processes stoped. "

    } else{

        $procs | Stop-Process
    }
}

Function Bamboozle([string] $path){
    
    [char]$letter = (Get-Random -Minimum 65 -Maximum 90)
    
    Write-Host -ForegroundColor Blue -BackgroundColor Yellow "Prints out a goofy message. $letter"

    Set-Location $path 
    Get-ChildItem $letter | where {! $_.PSIsContainer} |Remove-Item -WhatIf
    pause
 
}