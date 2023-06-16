# WARNING: `make` *requires* the use of tabs, not spaces, at the start of each command

PYTHON_INTERPRETER = venv/bin/python
PIP = venv/bin/pip

default: help

.PHONY: help
help: # Help command
  @sed -nE 's/^([a-zA-Z0-9_-]+):.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: coverage
coverage: # hello
	pytest --cov --cov-report term-missing --cov-report term:skip-covered

.PHONY: format
format: # Formats
	black app/
	isort --project app --project tests app/app/. app/tests/.
	flake8 app/

.PHONY: lint
lint: # Run linter, then exit with an error code if needed
	flake8 app/
	black --diff app/
	isort --check-only --diff --project app --project tests app/app/. app/tests/.

.PHONY: test
test: # Run pytest
	pytest

.PHONY: install
install: # Install the project dependencies defined in the requirements.txt file.
	$(PIP) install -r requirements.txt

.PHONY: clean
clean: # Remove the generated .pyc files and pycache directories.
	rm -rf __pycache__ *.pyc

flag: # print the flag
	echo "N2gxNV8xNV80X3IzZF9oM3JyMW42" | base64 --decode'
