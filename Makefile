.RUN_CONTEXT = docker-compose exec spring

pre-push: slim-lint factory-bot-lint rubocop breakman rspec

up:
	docker-compose up -d

down:
	docker-compose down --remove-orphans
	rm -f tmp/pids/server.pid

restart: down up logs

logs:
	docker-compose logs -f

build:
	docker-compose build

bash:
	$(.RUN_CONTEXT) bash

psql:
	docker-compose exec pg psql -U postgres monorail_development

.PHONY: rspec
rspec:
	$(.RUN_CONTEXT) spring rspec

# root以下を対象にすると非常に遅い（node_modulesが原因？）。頻繁に編集する部分
# だけ対象にする。CIではroot以下全部が対象にはなってる。
rubocop:
	$(.RUN_CONTEXT) bundle exec rubocop --auto-correct app config db spec

brakeman:
	$(.RUN_CONTEXT) bundle exec brakeman

slim-lint:
	$(.RUN_CONTEXT) bundle exec slim-lint app/views

factory-bot-lint:
	$(.RUN_CONTEXT) bundle exec rake factory_bot:lint

annotate_models:
	$(.RUN_CONTEXT) rake annotate_models

bundle/install:
	$(.RUN_CONTEXT) bundle install
