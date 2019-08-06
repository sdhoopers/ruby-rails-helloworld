FROM ruby:2.5.1-alpine


# for Java
RUN apk add --no-cache openjdk8

 
CMD "/bin/bash"
