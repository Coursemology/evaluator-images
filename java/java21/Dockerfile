FROM coursemology/evaluator-image-base:deb12
LABEL org.opencontainers.image.authors="Coursemology <coursemology@googlegroups.com>"

# Set HOME variable to a location accessible by the coursemology user
ENV HOME /home/coursemology
ENV JAVA_HOME /opt/jdk-21.0.5

RUN apt-get update \
	&& apt-get install -y wget ca-certificates-java \
	&& cd $HOME \
	&& mkdir lib \
	&& cd lib \
	&& wget https://repo.maven.apache.org/maven2/org/testng/testng/6.11/testng-6.11.jar \
	&& wget https://repo.maven.apache.org/maven2/com/beust/jcommander/1.72/jcommander-1.72.jar \
	&& wget https://download.oracle.com/java/21/archive/jdk-21.0.5_linux-x64_bin.tar.gz \
	&& tar -xzf jdk-21.0.5_linux-x64_bin.tar.gz \
	&& mv jdk-21.0.5 /opt/ \
	&& update-alternatives --install /usr/bin/jexec jexec /opt/jdk-21.0.5/lib/jexec 1 \
	&& update-alternatives --set jexec /opt/jdk-21.0.5/lib/jexec \
	&& update-alternatives --install /usr/bin/java java /opt/jdk-21.0.5/bin/java 1 \
	&& update-alternatives --set java /opt/jdk-21.0.5/bin/java \
	&& update-alternatives --install /usr/bin/keytool keytool /opt/jdk-21.0.5/bin/keytool 1 \
	&& update-alternatives --set keytool /opt/jdk-21.0.5/bin/keytool \
	&& update-alternatives --install /usr/bin/rmiregistry rmiregistry /opt/jdk-21.0.5/bin/rmiregistry 1 \
	&& update-alternatives --set rmiregistry /opt/jdk-21.0.5/bin/rmiregistry \
	&& apt-get install -y ant \
	&& apt-get install -y testng \
	&& apt-get remove -y wget \
	&& rm -rf jdk-21.0.5_linux-x64_bin.tar.gz /var/lib/apt/lists/*
