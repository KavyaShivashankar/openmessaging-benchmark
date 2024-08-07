#!/bin/bash
#RPD_BROKERS="10.0.0.124 10.0.0.95 10.0.0.138"

BRKR1="10.0.0.124"
BRKR2="10.0.0.95"
BRKR3="10.0.0.138"

echo "Applying network delay of $1 to $BRKR1, $BRKR2, $BRKR3"
 
ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR1} -t "sudo tc qdisc del dev ens5 root;sudo tc qdisc add dev ens5 root handle 1: prio;sudo tc qdisc add dev ens5 parent 1:3 handle 30: netem delay ${1}ms; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR2} flowid 1:3; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR3} flowid 1:3; tc qdisc show  dev ens5"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR2} -t "sudo tc qdisc del dev ens5 root;sudo tc qdisc add dev ens5 root handle 1: prio;sudo tc qdisc add dev ens5 parent 1:3 handle 30: netem delay ${1}ms; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR1} flowid 1:3; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR3} flowid 1:3; tc qdisc show  dev ens5"

ssh -i ~/.ssh/redpanda_aws ubuntu@${BRKR3} -t "sudo tc qdisc del dev ens5 root;sudo tc qdisc add dev ens5 root handle 1: prio;sudo tc qdisc add dev ens5 parent 1:3 handle 30: netem delay ${1}ms; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR2} flowid 1:3; sudo tc filter add dev ens5 protocol ip parent 1:0 prio 3 u32 match ip dst ${BRKR1} flowid 1:3; tc qdisc show  dev ens5"


#backup
   #ssh -i ~/.ssh/redpanda_aws ubuntu@$IP -t "sudo tc qdisc del dev ens5 root; sudo tc qdisc add dev ens5 root netem delay ${1}ms;tc qdisc show  dev ens5"
