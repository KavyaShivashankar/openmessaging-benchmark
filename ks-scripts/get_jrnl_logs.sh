#!/bin/bash

#WRKR1="10.0.0.60"
#WRKR2="10.0.0.129"
#WRKR3="10.0.0.175"
#WRKR4="10.0.0.222"

WRKR1="35.165.40.94"
WRKR2="35.92.59.95"
WRKR3="35.90.48.147"
WRKR4="54.244.105.234"

echo "Starting omb benchmark worker service on $WRKR1, $WRKR2, $WRKR3, $WRKR4"

ssh -i ~/.ssh/redpanda_aws ubuntu@${WRKR1} -t "journalctl -u benchmark-worker -n 10 --no-pager"
ssh -i ~/.ssh/redpanda_aws ubuntu@${WRKR2} -t "journalctl -u benchmark-worker -n 10 --no-pager"
ssh -i ~/.ssh/redpanda_aws ubuntu@${WRKR3} -t "journalctl -u benchmark-worker -n 10 --no-pager"
ssh -i ~/.ssh/redpanda_aws ubuntu@${WRKR4} -t "journalctl -u benchmark-worker -n 10 --no-pager"

echo "Done"
echo ""
