FROM wtanaka/alpine-37-uid-openjdk8
MAINTAINER http://wtanaka.com/dockerfiles
ARG GRADLE_VERSION=0.7
ENV PATH="${PATH}:/opt/gradle/bin"
# Setting JAVA_HOME explicitly is required in old gradle versions
ENV JAVA_HOME=/usr
# bash was needed up until Gradle 4.5.1
RUN mkdir -p /opt \
  && cd /tmp \
  && apk add --no-cache wget bash \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && cd /opt \
  && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && ln -s gradle-${GRADLE_VERSION} gradle \
  && apk del wget \
  && apk update \
  && rm -rf /var/cache/apk/*
