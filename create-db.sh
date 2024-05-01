docker run -d --name db-ufsc -p 5432:5432 -e POSTGRES_PASSWORD=password postgres;
docker exec -it db-ufsc bash -c "createdb -E UTF8 -T template0 -U postgres db-ufsc"
