FROM coursemology/evaluator-image-base:deb8
LABEL maintainer="Coursemology <coursemology@googlegroups.com>"

ENV LDFLAGS="-L/usr/local/lib/" \
    LD_LIBRARY_PATH="/usr/local/lib/" \
    CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
RUN apt-get update && apt-get install --force-yes -y wget \
  build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev git libsqlite3-dev \
  && wget -qO- https://www.openssl.org/source/openssl-1.0.2g.tar.gz | tar xz && cd openssl-1.0.2g && ./config shared --prefix=/usr/local/ && make && make install \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz \
  && tar xzf Python-3.9.6.tgz \
  && cd /root/Python-3.9.6 \
  && ./configure \
  && make \
  && make install \
  && pip3 install --upgrade pip
RUN pip3 install git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes \
  && pip3 install timeout-decorator \
  && pip3 install Pillow \
  && pip3 install numpy \
  && pip3 install scipy \
  && pip3 install matplotlib \
  && pip3 install pandas \
  && pip3 install sklearn \
  && pip3 install networkx \
  && pip3 install fnss
RUN pip3 install torch==1.9.0+cpu torchvision==0.10.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN cd /root \
  && rm -r /root/Python-3.9.6 \
  && rm -r /root/Python-3.9.6.tgz \
  && apt-get remove -y git \
  && rm -rf /var/lib/apt/lists/*
ENV PYTHON=/usr/local/bin/python3.9
