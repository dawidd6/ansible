all: bootstrap deploy

bootstrap:
	sudo apt-get update
	sudo apt-get install ansible

deploy:
	ansible-playbook -vvv $(OPTIONS) playbook.yml -K
