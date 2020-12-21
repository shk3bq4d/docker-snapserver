FROM debian:bullseye

ENV SNAPCAST_VERSION=0.22.0

RUN apt-get update
RUN apt-get -y install libasound2 mpv avahi-daemon libnss-mdns wget
RUN apt-get clean && rm -fR /var/lib/apt/lists

RUN wget -O /tmp/snapserver.deb https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_amd64.deb

RUN dpkg -i /tmp/snapserver.deb
