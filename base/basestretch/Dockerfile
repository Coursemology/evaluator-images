FROM debian:9
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install -y --force-yes \
	make \
	&& rm -rf /var/lib/apt/lists/*
RUN groupadd -r coursemology \
	&& useradd -r -g coursemology -m coursemology

COPY usr /usr
ENTRYPOINT ["/usr/local/bin/coursemology-evaluate.sh"]
