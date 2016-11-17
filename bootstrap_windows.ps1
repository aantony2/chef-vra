new-item -path C:\chef\client.rb -type file

$file =  C:\chef\client.rb
$chef_server_url = $args[0]

Add-Content -Path $File -Value "log_level       :info"
Add-Content -Path $File -Value "log_location    STDOUT"
Add-Content -Path $File -Value "chef_server_url    `$args[2]`"
Add-Content -Path $File -Value "validation_key  `'/etc/chef/validation.pem'`"

Add-Content -Path $File -Value "validation_client_name `'onecloud-validator'`"
Add-Content -Path $File -Value "ssl_verify_mode `:verify_none`"

new-item -path C:\chef\firstboot.json -type file
