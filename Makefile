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

trunk-down:
	trunk daemon shutdown

check:
	trunk check
	trunk-down

fmt:
	trunk cache clean
	trunk fmt
	trunk-down

trunk-remove:
	trunk cache clean
	trunk deinit
	trunk-down

trunk-init: trunk-install
	trunk init
	trunk-down

lint: fmt check
