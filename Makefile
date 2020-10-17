all:
	make lint
	make test
	make migrate
	make runserver

test:
	coverage run --source='.' manage.py test
	coverage report
	coverage html -i

runserver:
	python manage.py runserver 0.0.0.0:8000

migrate:
	python manage.py migrate

lint:
	make lint-black
	make lint-isort
	make lint-flake8
	make lint-mypy

lint-black:
	black .

lint-isort:
	isort .

lint-flake8:
	flake8 .

lint-mypy:
	mypy --strict .
