# mydb

# Build the Docker image
docker build -t mydb .

# Run the Docker container with a volume
docker run --name mydb-container -p 5432:5432 -v mydb-data:/var/lib/postgresql/data -d mydb

# Access the PostgreSQL database
docker exec -it mydb-container psql -U myuser -d mydb

# List of tables
\dt

# Count transaction
SELECT count_trxn_by_chain('Ethereum');

# Check data in bitcoin_historical_price table
SELECT * FROM bitcoin_historical_price
LIMIT 5;

# Stop the Docker container
docker stop mydb-container

# Remove the Docker container
docker rm mydb-container

# Remove the Docker image
docker rmi mydb

# Remove the Docker volume
docker volume rm mydb-data

# Add network in order to have other application access mydb
docker network create mynetwork
docker run --name mydb-container --network mynetwork -p 5432:5432 -v mydb-data:/var/lib/postgresql/data -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=mydb -d postgres:16-alpine

# In VSC, intsall PostgreSQL, DB credentials on render.com
mydb-xxxx.onrender.com
5432
mydb
myuser
mypassword