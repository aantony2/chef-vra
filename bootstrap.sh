#!/bin/bash

function create_clientrb {
/bin/cat > $1 <<EOF
log_level       :info
log_location    STDOUT
chef_server_url '$2'
validation_key  '/etc/chef/validation.pem'
validation_client_name 'onecloud-validator'
ssl_verify_mode :verify_none
EOF
}

function create_firstbootjson {
/bin/cat > $1 <<EOF
{
  "run_list": ["recipe[$2]"]
}
EOF
}

DATE=`/bin/date +"%H.%M.%s-%m-%d-%Y"`
OUTDIR=/root/prov-logs
OUTLOG=$OUTDIR/bootstrap-$DATE.log

if [[ ! -d $OUTDIR ]] # Check to see if the provisioning log directory exists
then
  /bin/mkdir -p $OUTDIR
fi
# initialize the logfile
> $OUTLOG

if [ $# -lt 4 ];
then
        echo "Usage: $0 <Datacenter>  <Service-Level> <Roles> <Url>"
        exit 1
fi

CHEFDIR=/etc/chef
CLIENTRBFILE=$CHEFDIR/client.rb
FIRSTBOOTJSON=$CHEFDIR/first-boot.json
DATACENTER=$1
SERVICELEVEL=$2
CHEFSERVERURL=$4
CHEFROLES=$3

if [[ ! -d $CHEFDIR ]] # Check to see if chef directory exists
then
  /bin/mkdir -p $CHEFDIR
fi

/bin/cp /tmp/validation.pem $CHEFDIR/validation.pem

echo "Chef directory $CHEFDIR created successfully." >> $OUTLOG
create_clientrb $CLIENTRBFILE $CHEFSERVERURL
echo "Client Rb file created successfully with Chef Server Url $CHEFSERVERURL." >> $OUTLOG
create_firstbootjson $FIRSTBOOTJSON $3
echo "First boot json file created successfully." >> $OUTLOG

chef-client -j $FIRSTBOOTJSON --environment $1

exit 0