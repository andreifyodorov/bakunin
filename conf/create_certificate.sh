#!/usr/bin/env bash

openssl req \
	-newkey rsa:2048 \
	-sha256 \
	-nodes \
	-x509 \
	-days 365 \
	-keyout usr/local/etc/nginx/cert.key \
	-out 	usr/local/etc/nginx/cert.pem \
	-subj "/C=NL/ST=North Holland/L=Amsterdam/CN=*.bakunin.nl"