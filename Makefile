trunk = trunks
dc = docker compose -f docker-compose.yml -f .devcontainer/docker-compose.yml

# run the app outside docker
run:
	$(trunk) serve

# build to deploy
build:
	$(trunk) build --release

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
