To set up Jenkins for a new cookbook:

In Bitbucket:
1) Open the repository
2) Click the "Settings" gear on the left-hand menu
3) Click "Hooks" on the left-hand menu
4) Click "Enabled" on "Post-Receive WebHooks"
5) Enter "http://oce-249.oc.mckesson.com:8080/bitbucket-hook/" as the URL
6) Click "Enable"

In Jenkins:
1) Click the "Chef Cookbooks" folder
2) Click "New Item" on the left-hand menu
3) Enter the item name. It is recommended that this match the repository name
4) Select "Freestyle project"
5) Under "if you want to create a new item from other existing, you can use this option", enter "_cookbook_template"
6) Click "OK"
7) Replace or clear the Description
8) Click the "Advanced..." button under "Name of template"
9) Check the box next to "Retain local Source Code Management"
10) Under "Source Code Management", update the "Repository URL" field to the correct URL
11) Click "Save"
12) If you'd like to test the build, click "Build Now". You can then click the build, and "Console Output" if troubleshooting is necessary.

--------------------

To update the commands used for the build process:
In Jenkins:
1) Click the "Chef Cookbooks" folder
2) Click "_cookbook_template"
3) Click "Configure" in the left-hand menu
4) Update the text area under "Build"
5) Any changes will be applied to all existing and future projects

To add additional Chef Server to upload to:
SSH to Jenkins:
1) cd to /var/lib/jenkins
2) Make a 2nd .chef folder (like .chef-east)
3) Add a knife.rb and client key to this new directory
4) Create a berkshelf config file with the new chef server and path to client key. See http://berkshelf.com/#configuring-berkshelf for more information.

In Jenkins UI:
1) Use the above instructions to update the build process
2) Add "berks -c /path/to/berkshelf-config.json upload" to the end of the build
