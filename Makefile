all:
	docker-compose build && docker build --tag cadizm/rails-env .

shell:
	docker-compose run --rm app /bin/bash

push:
	docker push cadizm/rails-env

.PHONY: all shell push
