FROM coursemology/evaluator-image-base:deb10
MAINTAINER Coursemology <coursemology@googlegroups.com>

# Set HOME variable to a location accessible by the coursemology user
ENV HOME /home/coursemology
ENV JAVA_HOME /opt/jdk-17.0.9

RUN echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y wget ca-certificates-java \
	&& cd $HOME \
	&& mkdir lib \
	&& cd lib \
	&& wget https://repo.maven.apache.org/maven2/org/testng/testng/6.11/testng-6.11.jar \
	&& wget https://repo.maven.apache.org/maven2/com/beust/jcommander/1.72/jcommander-1.72.jar \
	&& wget https://download.oracle.com/java/17/archive/jdk-17.0.9_linux-x64_bin.tar.gz \
	&& tar -xzf jdk-17.0.9_linux-x64_bin.tar.gz \
	&& mv jdk-17.0.9 /opt/ \
	&& update-alternatives --install /usr/bin/jexec jexec /opt/jdk-17.0.9/lib/jexec 1 \
	&& update-alternatives --set jexec /opt/jdk-17.0.9/lib/jexec \
	&& update-alternatives --install /usr/bin/java java /opt/jdk-17.0.9/bin/java 1 \
	&& update-alternatives --set java /opt/jdk-17.0.9/bin/java \
	&& update-alternatives --install /usr/bin/keytool keytool /opt/jdk-17.0.9/bin/keytool 1 \
	&& update-alternatives --set keytool /opt/jdk-17.0.9/bin/keytool \
	&& update-alternatives --install /usr/bin/rmiregistry rmiregistry /opt/jdk-17.0.9/bin/rmiregistry 1 \
	&& update-alternatives --set rmiregistry /opt/jdk-17.0.9/bin/rmiregistry \
	&& apt-get install -y ant \
	&& apt-get install -y testng \
	&& apt-get remove -y wget \
	&& rm -rf jdk-17.0.9_linux-x64_bin.tar.gz /var/lib/apt/lists/*
