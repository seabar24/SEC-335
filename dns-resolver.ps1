# Resolves DNS for network prefixes
param($network,$server)

for ($prefix=1;$prefix -lt 255;$prefix++){

    $ip="$network.$prefix"

    $DNS=Resolve-DnsName -DnsOnly $ip -Server $server -ErrorAction Ignore | Select-Object -ExpandProperty Namehost
    
    if ($DNS -ne $null){

        echo "$ip $DNS"

    }
}