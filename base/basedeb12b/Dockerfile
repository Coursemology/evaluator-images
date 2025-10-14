FROM debian:12
LABEL org.opencontainers.image.authors="Coursemology <coursemology@googlegroups.com>"

RUN apt-get update && apt-get install -y make=4.3-4.1 \
	&& rm -rf /var/lib/apt/lists/*
RUN groupadd -r coursemology \
	&& useradd -r -g coursemology -m coursemology

COPY usr /usr
ENTRYPOINT ["/usr/local/bin/coursemology-evaluate.sh"]
