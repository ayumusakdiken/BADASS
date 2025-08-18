Write-Host "Starting Vagrant VM..."
try {
    vagrant up *> $null
} catch {
    Write-Host "Error while starting VM:"
    Write-Host $_
    exit 1
}

Write-Host "Vagrant VM started successfully."


Write-Host "Waiting for Vagrant to be ready..."
while ($true) {
    $result = vagrant ssh -c "exit" 2>$null
    if ($LASTEXITCODE -eq 0) {
        break
    }
    Start-Sleep -Seconds 5
}

Write-Host "Copying ./BGP folder to VM..."
try {
    vagrant upload "$PSScriptRoot\BGP" /home/vagrant/BGP *> $null
} catch {
    Write-Host "Error while uploading BGP folder:"
    Write-Host $_
    exit 1
}

Write-Host "Files copied to VM successfully."


try {
    vagrant ssh -c "bash /home/vagrant/BGP/p1_init.sh"
} catch {
    Write-Host "Error while executing init script:"
    Write-Host $_
    exit 1
}

Write-Host "GNS3 initialization script executed successfully."
