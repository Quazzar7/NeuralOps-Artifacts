# List Redis queues and their depths
redis-cli -h localhost INFO | grep '^queue:'
redis-cli -h localhost INFO KEYSPACE | grep 'db0:keys='
for q in $(redis-cli -h localhost Keys '*' | grep -E 'queue:[0-9]+$'); do 
  echo "$q: $(redis-cli -h localhost LLEN $q)"
done