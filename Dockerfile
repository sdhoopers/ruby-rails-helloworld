FROM ruby:2.3.0-alpine


# for Java
RUN apk add --no-cache openjdk8

 
CMD "/bin/bash"
