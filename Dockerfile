FROM debian:stable AS squeezebase
LABEL maintainer "Matt Dickinson"

#Installation of everything needed to setup snapcast
RUN apt-get update && apt-get install -y \
  squeezelite 
  
CMD squeezelite
