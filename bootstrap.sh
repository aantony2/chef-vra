#!/bin/bash

DATE=`/bin/date +"%H.%M.%s-%m-%d-%Y"`
OUTDIR=/root/prov-logs
OUTLOG=$OUTDIR/bootstrap-$DATE.log

if [[ ! -d $OUTDIR ]] # Check to see if the provisioning log directory exists
then
  /bin/mkdir -p $OUTDIR
fi
# initialize the logfile
> $OUTLOG

if [ $# -lt 3 ];
then
        echo "Usage: $0 <Datacenter> <Service-Level> <Roles>"
        exit 1
fi

DATACENTER=$1
SERVICELEVEL=$2

exit 0