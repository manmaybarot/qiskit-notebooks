.PHONY: create_env env_setup env_destroy open_lab

PYTHON_VERSION := 3.8
SYSTEM_PYTHON := $(shell which python$(PYTHON_VERSION))
PYTHON := ./venv/bin/python
JUPYTER := ./venv/bin/jupyter

ifndef SYSTEM_PYTHON
	$(error python$(PYTHON_VERSION) binary not found)
endif


create_env:
	$(SYSTEM_PYTHON) -m venv ./venv

env_destroy:
	rm -rf ./venv

env_setup: create_env
	$(PYTHON) -m pip install -r requirements.txt

open_lab:
	$(JUPYTER) lab
