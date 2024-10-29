#!/bin/bash

#WRKR1="10.0.0.60"
#WRKR2="10.0.0.129"
#WRKR3="10.0.0.175"
#WRKR4="10.0.0.222"

BRKR1="35.165.40.94"

echo "Setting  omb benchmark worker service on $WRKR1, $WRKR2, $WRKR3, $WRKR4"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR1} -t "sudo rpk cluster config set node_status_interval 500"

echo "Done"
echo ""
