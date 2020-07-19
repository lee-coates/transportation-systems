
# pymake compatibility
PY=python -m py_compile

.PHONY: help prepare-dev test lint run doc
    test
	lint
    install
    compile
	run

VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python3

.DEFAULT: help
help:
    @echo "make prepare-dev"
    @echo "       prepare development environment, use only once"
    @echo "make test"
    @echo "       run tests"
    @echo "make lint"
    @echo "       run pylint and mypy"
	@echo "make install"
    @echo "       run setup.py and install command"
    @echo "make run"
    @echo "       run project"
    @echo "make doc"
    @echo "       build sphinx docs"

prepare-dev:
    sudo apt-get -y install python3.6 python3-pip
    python3 -m pip install virtualenv
    make venv

# re-run installation of dependencies when setup.py is changed
venv: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: setup.py
    test -d $(VENV_NAME) || virtualenv -p python3 $(VENV_NAME)
    ${PYTHON} -m pip install -U pip
    ${PYTHON} -m pip install -e .
    touch $(VENV_NAME)/bin/activate

test: venv
    ${PYTHON} -m pytest

lint: venv
    ${PYTHON} -m pylint
    ${PYTHON} -m mypy

install:
    python setup.py\
    install
compile:
    $(PY) test.py

run: venv
    ${PYTHON} app.py

doc: venv
    $(VENV_ACTIVATE) && cd docs; make html