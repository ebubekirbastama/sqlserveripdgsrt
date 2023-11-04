$adapter = Get-NetAdapter | ? {$_.InterfaceAlias -eq 'Ethernet'} # Adaptör adını değiştirebilirsiniz
$ipAddress = "192.168.1.40"
$subnetMask = "255.255.255.0"
$gateway = "192.168.1.1"
$dns = "192.168.1.1"

# IP adresini ayarla
$adapter | Set-NetIPInterface -InterfaceMetric 2
$adapter | New-NetIPAddress -IPAddress $ipAddress -PrefixLength 24 -DefaultGateway $gateway

# DNS ayarlarını ayarla
$adapter | Set-DnsClientServerAddress -ServerAddresses $dns
