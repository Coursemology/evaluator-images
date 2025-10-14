FROM debian:12
LABEL org.opencontainers.image.authors="Coursemology <coursemology@googlegroups.com>"

RUN apt-get update && apt-get install -y make=4.3-4.1 wget=1.21.3-1+deb12u1 gcc=4:12.2.0-3 \
	&& rm -rf /var/lib/apt/lists/*
RUN groupadd -r coursemology \
	&& useradd -r -g coursemology -m coursemology

RUN wget "https://github.com/ncopa/su-exec/archive/refs/tags/v0.3.tar.gz" \
    && tar -xvf v0.3.tar.gz \
	&& cd su-exec-0.3 \
	&& make \
	&& mv su-exec /usr/local/bin/su-exec \
	&& cd ../ \
	&& rm -rf v0.3.tar.gz su-exec-0.3 \
	&& chmod +x /usr/local/bin/su-exec \
	&& apt-get purge -y --auto-remove wget gcc

COPY usr /usr
ENTRYPOINT ["/usr/local/bin/coursemology-evaluate.sh"]
