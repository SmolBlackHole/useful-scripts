$programs = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
            Select-Object DisplayName, DisplayVersion, InstallLocation |
            Where-Object { $_.DisplayName -ne $null } |
            ConvertTo-Json -Depth 100

$desktop = [Environment]::GetFolderPath("Desktop")
$filename = Join-Path $desktop "Programme.json"
$programs | Out-File -Encoding utf8 -FilePath $filename
