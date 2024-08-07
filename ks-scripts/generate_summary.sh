#for i in /Users/kavyashivashankar/omb_runs/result_all/1-topic-144-partitions-1kb-4p-4c-50mb-Redpanda+3xi3en.xlarge-2024-08-02*
for i in /Users/kavyashivashankar/omb_runs/result_all/1-topic-144-partitions-1kb-4p-4c-50mb-Redpanda+3xi3en.xlarge-2024-08-06-23-03-59.json
do 
  echo $i
  rm -rf ~/results/*
  cp $i ~/results/
  fname=`echo $i | cut -f6 -d"/" | rev | cut -f2- -d"." | rev`
  echo $fname
  python3 /Users/kavyashivashankar/rpd/github/openmessaging-benchmark/bin/generate_charts.py --results ~/results --output ~/output > ~/output/$fname.json
 cp ~/output/index.html ~/output/$fname.html
done
