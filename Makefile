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

trunk-install:
	curl https://get.trunk.io -fsSL | bash

check:
	trunk check

fmt:
	trunk fmt

trunk-remove:
	trunk deinit

trunk-init: trunk-install
	trunk init

lint: fmt check
