FROM ubuntu:latest



# for Java
RUN apt-get update && \
    apt-get install -y default-jdk


# for Ruby
RUN apt-get -y install wget build-essential automake git zlib1g-dev libssl-dev libreadline6-dev libyaml-dev libxml2-dev libxslt-dev libcurl4-openssl-dev libmysqlclient-dev libffi-dev \
 && wget --no-check-certificate https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz \
 && tar zxvf ruby-2.3.0.tar.gz \
 && cd ruby-2.3.0 \
 && ./configure && make && make install  \
 && cd ..  \
 && rm -f ruby-2.3.0.tar.gz  \
 && rm -rf ruby-2.3.0 \
 && gem install bundler
 
CMD "/bin/bash"
