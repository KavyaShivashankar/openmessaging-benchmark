echo "Removing network delay"

RPD_BROKERS="10.0.0.124 10.0.0.95 10.0.0.138"

for IP in $RPD_BROKERS;
do
   ssh -i ~/.ssh/redpanda_aws ubuntu@$IP -t "sudo tc qdisc del dev ens5 root; tc qdisc show  dev ens5"
done
