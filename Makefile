dc = docker compose -f docker-compose.yml

# docker compose commands
docker-up:
	$(dc) up -d

docker-start:
	$(dc) start

docker-down:
	$(dc) down

docker-stop:
	$(dc) stop

docker-logs:
	$(dc) logs -f
