#!/bin/bash

ansible-playbook \
	--ask-become-pass \
	--inventory localhost, \
	--connection local \
	workstation.yml \
	$@
