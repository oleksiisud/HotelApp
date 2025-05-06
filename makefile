all: driver import run

driver: clean
	wget https://dlm.mariadb.com/4234102/Connectors/java/connector-java-3.5.3/mariadb-java-client-3.5.3.jar -O lib/mariadb-java-client-3.5.3.jar

import:
	mysql < data/hotel.sql

run: compile
	java -cp bin:lib/mariadb-java-client-3.5.3.jar HotelApp

compile:
	javac -d bin src/*.java

clean:
	rm -f lib/mariadb-java-client-3.5.3.jar