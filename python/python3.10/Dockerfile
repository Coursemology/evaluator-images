FROM coursemology/evaluator-image-base:deb10-new
LABEL maintainer="Coursemology <coursemology@googlegroups.com>"

ENV LDFLAGS="-L/usr/local/lib/" \
    LD_LIBRARY_PATH="/usr/local/lib/" \
    CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
RUN apt-get update && apt-get install -y wget \
  build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev git libsqlite3-dev liblzma-dev openssl \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.10.6/Python-3.10.6.tgz \
  && tar xzf Python-3.10.6.tgz \
  && cd /root/Python-3.10.6 \
  && ./configure \
  && make \
  && make install \
  && pip3 --no-cache-dir install --upgrade pip
RUN pip3 install --no-cache-dir git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes \
  && pip3 --no-cache-dir install timeout-decorator Pillow networkx fnss\
  && pip3 --no-cache-dir install numpy scipy matplotlib \
  && pip3 --no-cache-dir install pandas sklearn
RUN pip3 install --no-cache-dir torch==1.12.1+cpu torchvision==0.13.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN cd /root \
  && rm -r /root/Python-3.10.6 \
  && rm -r /root/Python-3.10.6.tgz \
  && apt-get remove -y git wget \
  && rm -rf /var/lib/apt/lists/*
ENV PYTHON=/usr/local/bin/python3.10
