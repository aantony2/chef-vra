param ( 
    [string]$ChefServerUrl, 
    [string[]]$Recipe, 
    [string]$Environment, 
    [string]$BasePath = 'c:/chef' )

if (Test-Path "$BasePath/client.rb")
{
    Remove-Item "$BasePath/client.rb"
}
new-item -path "$BasePath/client.rb" -type file

Add-Content "$BasePath/client.rb" -Encoding Ascii -Value @"
log_level       :info
log_location    STDOUT
chef_server_url    $ChefServerUrl
validation_key  'c:/chef/validation.pem'

validation_client_name 'onecloud-validator'
ssl_verify_mode :verify_none
"@

if (Test-Path "$BasePath/first-boot.json")
{
    Remove-Item "$BasePath/first-boot.json"
}
new-item -path "$BasePath/first-boot.json" -type file
$runlist = $recipe | foreach {$text = ""} {
        $text += "recipe[$_],"
    } {$text.trim().trim(',')}
Add-Content "$BasePath/first-boot.json" -Encoding Ascii -Value "{`"run_list`": `"[$runlist]`"}"

$FIRSTBOOTJSON = "$BasePath/first-boot.json"

chef-client -j $FIRSTBOOTJSON --environment $environment
