FROM coursemology/evaluator-image-base:deb12
LABEL org.opencontainers.image.authors="Coursemology <coursemology@googlegroups.com>"

# Set HOME variable to a location accessible by the coursemology user
# Needed to clone GoogleTest framework to a location accessible by the coursemology user.
ENV HOME /home/coursemology
ENV CXX_STD="c++11"

RUN apt-get update && apt-get install -y \
	build-essential git \
  && git clone https://github.com/google/googletest.git $HOME/googletest \
  && cd $HOME/googletest \
  # Commit matching legacy (c11) container, dated Aug 29 2019
  && git checkout 565f1b848215b77c3732bca345fe76a0431d8b34 \
  && apt-get remove -y git \
  && apt-get autoremove -y \
  && apt-get install -y wget \
  && cd ../ \
  && mkdir boost \
  && cd boost \
  && wget https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz/download \
  && tar xvfz download \
  && rm download \
  && cd boost_1_64_0/ \
  && ./bootstrap.sh \
  && ./b2 cxxflags="--std=${CXX_STD}" stage threading=multi link=static \
  && ./b2 cxxflags="--std=${CXX_STD}" install threading=multi link=static \
  && cd ../../ \
  && rm -Rf boost/ \
  && apt-get remove -y wget \
  && rm -rf /var/lib/apt/lists/*

ENV BOOST_DIR /usr/local/lib

# Compile GTest library so that it doesn't need to be compiled on each evaluation
# The GTEST library would then be available as ${GTEST_DIR}/libgtest.a
ENV GTEST_DIR $HOME/googletest/googletest

RUN cd $GTEST_DIR/ \
  && g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} \
     -pthread -c ${GTEST_DIR}/src/gtest-all.cc \
     -std=${CXX_STD} \
  && ar -rv libgtest.a gtest-all.o

# Set env var for GoogleTest to output an xml report file
ENV GTEST_OUTPUT xml:./report.xml
