FROM ubuntu:14.04
MAINTAINER Yuichi Murata <mrk21info+github@gmail.com>

RUN apt-get -y update
RUN apt-get -y install wget curl tree vim
RUN apt-get -y install logrotate
RUN apt-get -y install nginx
ADD logrotate.d/* /etc/logrotate.d/

CMD ["/sbin/init","--startup-event=failsafe-boot"]
