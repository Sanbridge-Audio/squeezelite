FROM debian:stable AS squeezebase
LABEL maintainer "Matt Dickinson"

#Installation of everything needed to setup snapcast
RUN apt-get update && apt-get install -y \
	squeezelite 


#Environmental vairables
ENV SQUEEZE_SERVER=""
ENV SQUEEZE_AUDIO=""
ENV SQUEEZE_NAME=""


#start squeezelite
CMD squeezelite -o $SQUEEZE_AUDIO -s $SQUEEZE_SERVER -n $SQUEEZE_NAME
#CMD ["-o $SQUEEZE_AUDIO", "-s $SQUEEZE_SERVER"]
#ENTRYPOINT ["squeezelite"]

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]
