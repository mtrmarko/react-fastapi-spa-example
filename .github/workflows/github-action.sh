#!/bin/bash

function setup_backend_service()
{
	cd backend
	python3.9 -m venv venv
	source venv/bin/activate
	pip install pip-tools
	pip-sync requirements.txt
	deactivate
	cd service
	sudo ./managesvc.sh install marko
	cd ~/repos/react-fastapi-spa-example
}

function setup_frontend_service()
{
	cd frontend
	yarn
	yarn build
	cd service
	sudo ./managesvc.sh install marko
	cd ~/repos/react-fastapi-spa-example
}

cd ~/repos/react-fastapi-spa-example
setup_backend_service
setup_frontend_service
