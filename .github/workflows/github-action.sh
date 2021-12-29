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

cd ~/repos
if [ -d ~/repos/react-fastapi-spa-example ]; then
	cd ~/repos/react-fastapi-spa-example
	git clean -Xdf
	git clean -df
	git pull
	setup_backend_service
	setup_frontend_service
else
	git clone https://github.com/mtrmarko/react-fastapi-spa-example.git
	cd ~/repos/react-fastapi-spa-example
	setup_backend_service
	setup_frontend_service	
fi

##TODO: check for service existence

