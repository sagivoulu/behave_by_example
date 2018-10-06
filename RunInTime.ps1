$start = [int][double]::Parse((Get-Date -UFormat %s))

while(1)
{
    $now = [int][double]::Parse((Get-Date -UFormat %s))
    If(($now - $start) % 1 -eq 0) { Write-Host "Every second" }
    If(($now - $start) % 2 -eq 0) { Write-Host "Every 2 seconds" }
    If(($now - $start) % 3 -eq 0) { Write-Host "Every 3 seconds" }
    If(($now - $start) % 4 -eq 0) { Write-Host "Every 4 seconds" }
    If(($now - $start) % 5 -eq 0) { Write-Host "Every 5 seconds" }

    Start-Sleep -Seconds 1
}