#!/bin/bash
#RPD_BROKERS="10.0.0.124 10.0.0.95 10.0.0.138"

BRKR1="10.0.0.124"
BRKR2="10.0.0.95"
BRKR3="10.0.0.138"

echo "checking network delay of b/w $BRKR1, $BRKR2, $BRKR3"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR1} -t "ping -c 2 ${BRKR2}; ping -c 2 ${BRKR3}"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR2} -t "ping -c 2 ${BRKR3}; ping -c 2 ${BRKR1}"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR3} -t "ping -c 2 ${BRKR1}; ping -c 2 ${BRKR2}"

#backup
   #ssh -i ~/.ssh/redpanda_aws ubuntu@$IP -t "sudo tc qdisc del dev ens5 root; sudo tc qdisc add dev ens5 root netem delay ${1}ms;tc qdisc show  dev ens5"
