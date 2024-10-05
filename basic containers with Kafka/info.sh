#start the containers
docker compose up -d
#verify that the containers are running and get the container id to run the following commands
docker ps
#start a new topic in kafka
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic my-topic
#example of the above command
docker exec -it 88ae4404a969 /opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic an-intresting-topic
#here we create messages in the topic
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
#example of the above command
docker exec -it 88ae4404a969 /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic an-intresting-topic
#here we consume the messages from the topic
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning
#example of the above command
docker exec -it 88ae4404a969 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic an-intresting-topic --from-beginning

#we can run whatever experiment we want and then stop the containers with
docker compose down