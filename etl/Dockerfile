FROM debian:stable-slim

RUN ["mkdir", "/usr/share/man/man1", "/usr/share/man/man7"]

RUN apt-get update && apt-get install -qq -y \
	build-essential \
	libpq-dev \
	postgresql-client \
	--fix-missing \
	--no-install-recommends
