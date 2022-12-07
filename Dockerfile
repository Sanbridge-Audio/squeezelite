FROM debian:stable AS squeezebase
LABEL maintainer "Matt Dickinson"

#Installation of everything needed to setup snapcast
RUN apt-get update && apt-get install -y \
  alsa-utils \
  squeezelite 

#Environmental vairables
ENV $SQUEEZE_SERVER=""
ENV $SQUEEZE_AUDIO=""
#ENV $SL_NAME=""

#start squeezelite
CMD  
ENTRYPOINT squeezelite
