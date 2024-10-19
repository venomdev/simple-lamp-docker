docker-build: 
	docker compose build
		
docker-dev: 
	docker compose up -d

docker-dev-build: 
	docker compose up -d --build

docker-down:	
	docker compose down

docker-db-rm:
	sudo rm -rf db/*

docker-stop:
	docker compose stop

docker-up:
	docker compose up -d --build

docker-up-build:
	docker compose up -d --build --force-recreate
