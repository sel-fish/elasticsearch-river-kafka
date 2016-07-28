curl -XPUT 'localhost:9200/_river/kafka-river/_meta' -d '
{
    "type" : "kafka",
    "kafka" : {
       "zookeeper.connect" : "localhost:2181",
       "zookeeper.connection.timeout.ms" : 10000,
       "topic" : "summary-markers",
       "message.type" : "json",
       "group.id" : "test"
   },
   "index" : {
       "index" : "summary-markers",
       "type" : "status",
       "bulk.size" : 1,
       "concurrent.requests" : 1,
       "action.type" : "index",
       "flush.interval" : "1m"
    },
    "statsd": {
       "host" : "localhost",
       "prefix" : "kafka.river",
       "port" : 61470,
       "log.interval" : 10
    }
}'
