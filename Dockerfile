FROM debian:stable AS squeezebase
LABEL maintainer "Matt Dickinson"

#Installation of everything needed to setup snapcast
RUN apt-get update && apt-get install -y \
  alsa-utils \
  squeezelite 

#Environmental vairables
ENV SQUEEZE_SERVER=""
ENV SQUEEZE_AUDIO=""


#start squeezelite
CMD ["-o $SQUEEZE_AUDIO", "-s $SQUEEZE_SERVER"]
ENTRYPOINT ["squeezelite"]
#ENTRYPOINT /usr/bin/squeezelite

#front:CARD=v15,DEV=0

