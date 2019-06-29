build:
	docker-compose build

shell:
	docker-compose run --rm knowledge-app bash

clean:
	rm -rf knowledge-example
	rm -rf mysql-data
	docker system prune -f
	docker-compose stop
	docker rmi knowledge-app
	docker rmi knowledge-mysql



run:
	docker-compose up