new-item -path C:\chef\client.rb -type file

$file =  C:\chef\client.rb
$chef_server_url = $args[0]

Add-Content C:\chef\client.rb -Value "log_level       :info"
Add-Content C:\chef\client.rb -Value "log_location    STDOUT"
Add-Content C:\chef\client.rb -Value "chef_server_url    $args[2]"
Add-Content C:\chef\client.rb -Value "validation_key  \`'/etc/chef/validation.pem\`'"

Add-Content C:\chef\client.rb -Value "validation_client_name \`'onecloud-validator`'"
Add-Content C:\chef\client.rb -Value "ssl_verify_mode `:verify_none"

new-item -path C:\chef\firstboot.json -type file
