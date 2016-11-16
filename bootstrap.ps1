New-Item C:\chef\client.rb -type file

$file =  C:\chef\client.rb
Add-Content -Path $File -Value "log_level       :info"
Add-Content -Path $File -Value"log_location    STDOUT"
Add-Content -Path $File -Value"validation_key  `'/etc/chef/validation.pem'`"
Add-Content -Path $File -Value"validation_client_name `'onecloud-validator'`"
Add-Content -Path $File -Value"ssl_verify_mode `:verify_none`"

New-Item C:\chef\firstboot.json -type file
