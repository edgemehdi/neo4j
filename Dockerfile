FROM edgemehdi/basic-pkgs
MAINTAINER Mehdi mehdi@edge.com

RUN wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -
RUN echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install neo4j

RUN sed -i -e "s/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/g" /etc/neo4j/neo4j-server.properties 
RUN service neo4j-service stop

# start neo4j server, available at http://localhost:7474 of the target machine
CMD /var/lib/neo4j/bin/neo4j start

EXPOSE 7474
