############################################################
# Dockerfile to build supervisor container image
# based on Ubuntu Xenial
############################################################
# Container APP für Video Bearbeitung
############################################################

# Set the base Image
FROM derbrummbaer/im-base-phusion1804:latest

# File Author / Maintainer
MAINTAINER Sven Berger

############################################################
# RUN INSTALL AS root
############################################################
USER root

############################################################
# don't ask for stupid things 
############################################################
ENV DEBIAN_FRONTEND noninteractive 
RUN echo APT::Install-Recommends "0"; >> /etc/apt/apt.conf 
RUN echo APT::Install-Suggests "0"; >> /etc/apt/apt.conf 

############################################################
# Environment Variables
############################################################
ENV LC_ALL de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV USERNAME mediaeditor
ENV USERID 1105
ENV GROUPID 100

############################################################
# Folders needed
############################################################
VOLUME /mnt/server/mediavdr
VOLUME /mnt/server/mediavdrtmp
VOLUME /mnt/server/mediatmp
VOLUME /mnt/server/mediaupload
VOLUME /mnt/server/scripte

############################################################
# Ports needed
############################################################

############################################################
# Ports needed by App
############################################################

############################################################
# Container Users
############################################################
RUN groupmod -n $USERNAME users
RUN adduser --uid $USERID --gid 100 --disabled-login --no-create-home --disabled-password $USERNAME

############################################################
# Update Repository and upgrade Software
############################################################
COPY config/sources.list /etc/apt/sources.list
RUN apt-get update; apt-get install apt-utils locales ubuntu-extras-keyring -y; apt-get update; apt-get dist-upgrade -y

############################################################
# Konfigure timezone and locale
############################################################
RUN echo "Europe/Berlin" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN dpkg-reconfigure locales && locale-gen de_DE.UTF-8 && /usr/sbin/update-locale de_DE.UTF-8
RUN echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen ; locale-gen de_DE.UTF-8; echo LANG="de_DE.UTF-8" >> /etc/default/locale

############################################################
# Add Software Repositories
############################################################
RUN apt-get update; apt-get -qy install \
nano \
software-properties-common && \
apt-add-repository ppa:stebbins/handbrake-releases -y && \
apt-get update && \
apt-get dist-upgrade -qy

############################################################
# Begin Installation Mediatools
############################################################
RUN apt-get install \
libav-tools \
# libavcodec-extra-54 \
mediainfo \
handbrake-cli \
mkvtoolnix \
exiftool \
-y

############################################################
# Begin Installation WebDAV Zugriff für Fotos
############################################################
RUN apt-get install ca-certificates davfs2 -y

############################################################
# Copy Files
############################################################
RUN mkdir /etc/service/copy
ADD scripte/copy_scripte.sh /etc/service/copy/run
RUN chmod +x /etc/service/copy/run

############################################################
# Remove Apt Data
############################################################
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############################################################
# Container RUN USER
############################################################
#USER $USERNAME

############################################################
# Container Start
############################################################

#CMD ["/usr/bin/supervisord"]
#ENTRYPOINT ["/usr/local/bin/vdr_merge"]
#CMD ["/bin/bash"]
ENTRYPOINT ["/etc/service/copy/run"]
