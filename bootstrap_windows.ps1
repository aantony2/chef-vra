new-item -path /Users/rkailas/Mckesson/client.rb -type file


Add-Content /Users/rkailas/Mckesson/client.rb -Value "log_level       :info"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "log_location    STDOUT"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "chef_server_url    $($args[0])"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "validation_key  '/etc/chef/validation.pem'"

Add-Content /Users/rkailas/Mckesson/client.rb -Value "validation_client_name 'onecloud-validator'"
Add-Content /Users/rkailas/Mckesson/client.rb -Value "ssl_verify_mode `:verify_none"

new-item -path /Users/rkailas/Mckesson/firstboot.json -type file

Add-Content /Users/rkailas/Mckesson/firstboot.json -Value '{"run_list": ["recipe[getting-started]"]}'
