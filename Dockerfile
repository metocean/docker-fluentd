FROM metocean/aroha:v1.0.0
MAINTAINER Thomas Coats <thomas@metocean.co.nz>

ENV FLUENTD_VERSION=0.12.22

ADD . /install/
RUN /install/install.sh
CMD ["/sbin/initsh"]