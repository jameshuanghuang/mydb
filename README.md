# mydb

# Build the Docker image
docker build -t mydb .

# Run the Docker container with a volume
docker run --name mydb-container -p 5432:5432 -v mydb-data:/var/lib/postgresql/data -d mydb

# Access the PostgreSQL database
docker exec -it mydb-container psql -U myuser -d mydb

# Stop the Docker container
docker stop mydb-container

# Remove the Docker container
docker rm mydb-container

# Remove the Docker volume
docker volume rm mydb-data

# Run the Docker container again with the same volume
docker run --name mydb-container -p 5432:5432 -v mydb-data:/var/lib/postgresql/data -d mydb

# list of tables
\dt