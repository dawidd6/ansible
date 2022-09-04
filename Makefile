all: bootstrap deploy

bootstrap:
	sudo apt-get update
	sudo apt-get install ansible build-essential procps curl file git zlib1g-dev

deploy:
	ansible-playbook -vvv $(OPTIONS) playbook.yml -K
