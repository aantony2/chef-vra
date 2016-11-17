if (!(Test-Path "/Users/rkailas/Mckesson/client.rb"))
{
  new-item -path /Users/rkailas/Mckesson/client.rb -type file
}

else
{
Add-Content /Users/rkailas/Mckesson/client.rb -Value "log_level       :info"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "log_location    STDOUT"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "chef_server_url    $($args[0])"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "validation_key  '/etc/chef/validation.pem'"

Add-Content /Users/rkailas/Mckesson/client.rb -Value "validation_client_name 'onecloud-validator'"
Add-Content /Users/rkailas/Mckesson/client.rb -Value 'ssl_verify_mode :verify_none'
}

if (!(Test-Path "/Users/rkailas/Mckesson/first-boot.json"))
{
new-item -path /Users/rkailas/Mckesson/first-boot.json -type file
}
else
{
Add-Content /Users/rkailas/Mckesson/first-boot.json -Value "{`"run_list`": [`"recipe[$($args[1])]`"]}"
}

$FIRSTBOOTJSON = "/Users/rkailas/Mckesson/first-boot.json"

chef-client -j $FIRSTBOOTJSON
