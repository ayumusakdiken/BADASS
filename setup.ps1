vagrant up

Write-Host "Waiting for Vagrant to be ready..."
while ($true) {
    $result = vagrant ssh -c "exit" 2>$null
    if ($LASTEXITCODE -eq 0) {
        break
    }
    Start-Sleep -Seconds 5
}

$SERVER_IP = vagrant ssh -c "hostname -I | awk '{print `$2}'" 2>$null
$SERVER_IP = $SERVER_IP.Trim()

Write-Host "Detected VM IP: $SERVER_IP"

scp -r ./BGP vagrant@${SERVER_IP}:/home/vagrant/BGP
Write-Host "Files copied to VM successfully."
