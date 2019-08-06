FROM ubuntu:latest


RUN apt-get install -y language-pack-ja-base language-pack-ja
update-locale LANG=ja_JP.UTF-8 LANGUAGE=”ja_JP:ja”

# for Java
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer

# for Ruby
RUN apt-get -y install build-essential automake git zlib1g-dev libssl-dev libreadline6-dev libyaml-dev libxml2-dev libxslt-dev libcurl4-openssl-dev libmysqlclient-dev libffi-dev \
 && wget --no-check-certificate https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.3.0.tar.gz \
 && tar zxvf ruby-2.3.0.tar.gz \
 && cd ruby-2.3.0 \
 && ./configure && make && make install  \
 && cd ..  \
 && rm -f ruby-2.3.0.tar.gz  \
 && rm -rf ruby-2.3.0 \
 && gem install bundler
 
CMD "/bin/bash"
