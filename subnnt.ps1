$adapter = Get-NetAdapter -Name "Ethernet" # Adaptör adını değiştirmeyi unutmayın
$ipAddress = "192.168.1.40"
$subnetMask = "255.255.255.0"
$gateway = "192.168.1.1"
$dns = "192.168.1.1"

# IP ayarlarını yapılandır
$adapter | Remove-NetIPAddress -Confirm:$false
$adapter | New-NetIPAddress -AddressFamily IPv4 -IPAddress $ipAddress -PrefixLength 24 -DefaultGateway $gateway

# DNS ayarlarını yapılandır
Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dns
