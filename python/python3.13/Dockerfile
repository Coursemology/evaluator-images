FROM coursemology/evaluator-image-base:deb12
LABEL maintainer="Coursemology <coursemology@googlegroups.com>"

ENV LDFLAGS="-L/usr/local/lib/" \
    LD_LIBRARY_PATH="/usr/local/lib/" \
    CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
RUN apt-get update && apt-get install -y wget \
  build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev git libsqlite3-dev liblzma-dev openssl \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.13.3/Python-3.13.3.tgz \
  && tar xzf Python-3.13.3.tgz \
  && cd /root/Python-3.13.3 \
  && ./configure \
  && make \
  && make install \
  && pip3 --no-cache-dir install --upgrade pip \
  && cd /root \
  && rm -r /root/Python-3.13.3 \
  && rm -r /root/Python-3.13.3.tgz \
  && pip3 install --no-cache-dir git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes-2024 \
  && apt-get remove -y git wget \
  && rm -rf /var/lib/apt/lists/*
RUN pip3 --no-cache-dir install timeout-decorator Pillow networkx fnss\
  && pip3 --no-cache-dir install numpy scipy matplotlib \
  && pip3 --no-cache-dir install pandas scikit-learn \
  && pip3 --no-cache-dir install PuLP sympy
RUN pip3 install --no-cache-dir torch==2.7.0 torchvision==0.22.0 --index-url https://download.pytorch.org/whl/cpu
ENV PYTHON=/usr/local/bin/python3.13
