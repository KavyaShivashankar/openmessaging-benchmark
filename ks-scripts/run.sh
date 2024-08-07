# Remove any added n/w latency via tc
. ./tc-remove.sh
. ./tc-remove.sh

# Check pings between brokers to validate
. ./check-pings.sh

# Add n/w latency. Half the n/w latency you want between the brokers for the value of ${1}
. ./tc-apply.sh ${1}

# Check pings between brokers to validate
. ./check-pings.sh

# Run OMB.  wkld -> 1-topic-144-partitions-1kb-4p-4c-50mb for 10 mins.
sudo bin/benchmark -d driver-redpanda/redpanda-ack-all-linger-1ms.yaml workloads/1-topic-144-partitions-1kb-4p-4c-50mb.yaml
sudo bin/benchmark -d driver-redpanda/redpanda-ack-1-linger-1ms.yaml workloads/1-topic-144-partitions-1kb-4p-4c-50mb.yaml 
sudo bin/benchmark -d driver-redpanda/redpanda-ack-0-linger-1ms.yaml workloads/1-topic-144-partitions-1kb-4p-4c-50mb.yaml
