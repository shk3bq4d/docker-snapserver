FROM debian:bookworm

ENV SNAPCAST_VERSION=0.29.0

RUN apt-get update
RUN apt-get -y install libasound2 mpv avahi-daemon libavahi-client3 libnss-mdns wget
RUN apt-get clean && rm -fR /var/lib/apt/lists

#                               https://github.com/badaix/snapcast/releases/download/v0.29.0/snapclient_0.29.0-1_amd64_bookworm.deb
RUN wget -O /tmp/snapserver.deb https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_amd64_bookworm.deb

RUN dpkg -i /tmp/snapserver.deb
