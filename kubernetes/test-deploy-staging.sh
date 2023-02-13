#!/bin/bash

helm upgrade \
	--install \
	--create-namespace \
	--atomic \
	--wait \
	--namespace staging \
	codetunnel \
	./codetunnel \
	--set image.repository=calvincs.azurecr.io
