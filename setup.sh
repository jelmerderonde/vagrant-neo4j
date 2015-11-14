echo "Adding neo4j signing key..."
sudo wget -O - https://debian.neo4j.org/neotechnology.gpg.key | apt-key add - # Import signing key

echo "Adding neo4j repository..."
sudo echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list # Create an Apt sources.list file

echo "Updating repository..."
sudo apt-get update

echo "Setting locale to en_US.utf8..."
sudo locale-gen en_US.utf8

echo "Installing neo4j and dependencies..."
sudo apt-get -y install neo4j

echo "Stopping neo4j service..."
sudo service neo4j-service stop

echo "Updating Neo4j Config..."
sudo sed -i 's/#org\.neo4j\.server\.webserver\.address=0\.0\.0\.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j/neo4j-server.properties
sudo sed -i 's/dbms\.security\.auth_enabled=true/dbms\.security\.auth_enabled=false/' /etc/neo4j/neo4j-server.properties

echo "Restarting Neo4j..."
sudo service neo4j-service start