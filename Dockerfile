FROM centos:centos7
LABEL maintainer="s18g455@stu.kagawa-u.ac.jp"
RUN yum update && \
      yum -y upgrade && \
      yum -y install epel-release

RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel wget unzip
RUN mkdir /src
WORKDIR /src
RUN wget https://services.gradle.org/distributions/gradle-5.1-rc-1-bin.zip && \
      mkdir /opt/gradle && \
      unzip -d /opt/gradle gradle-5.1-rc-1-bin.zip

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64
ENV PATH=$PATH:$JAVA_HOME/bin

COPY build-sample /answer/
WORKDIR /answer/build-sample
CMD ["/opt/gradle/gradle-5.1-rc-1/bin/gradle", "build"]
