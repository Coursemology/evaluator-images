FROM coursemology/evaluator-image-base:deb12
LABEL maintainer="Coursemology <coursemology@googlegroups.com>"

ARG PYTHON_VERSION=3.14.4

ENV LDFLAGS="-L/usr/local/lib/" \
    LD_LIBRARY_PATH="/usr/local/lib/" \
    CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"

COPY requirements.txt .

RUN apt-get update && apt-get install -y wget \
  build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev git libsqlite3-dev liblzma-dev openssl \
  && cd /root \
  && wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
  && tar xzf Python-${PYTHON_VERSION}.tgz \
  && cd /root/Python-${PYTHON_VERSION} \
  && ./configure \
  && make \
  && make install \
  && pip3 --no-cache-dir install --upgrade pip \
  && cd /root \
  && rm -r /root/Python-${PYTHON_VERSION} \
  && rm -r /root/Python-${PYTHON_VERSION}.tgz \
  && pip3 install --no-cache-dir git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes-2024 \
  && apt-get remove -y git wget \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir -r requirements.txt \
  && rm requirements.txt

ENV PYTHON=/usr/local/bin/python3.14
