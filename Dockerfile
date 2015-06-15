FROM alpine:3.2

RUN apk update

# Install supervisor
RUN apk add supervisor=3.1.3-r1

# Install haproxy
RUN apk add haproxy=1.5.12-r0

# Install iproute2 ('tc' command)
RUN apk add iproute2

# Install libnl3 ('nl-qdisc-add' command)
RUN apk add libnl3

# Purge APK cache
RUN rm -rf /var/cache/apk/*

# Install ccll/consul-template (a hacked version with support for customizable template delimeters)
ADD https://github.com/ccll/consul-template/releases/download/v0.7.0-1/consul-template /usr/local/bin/consul-template

# Install config files
ADD consul-template.conf /etc/consul-template.conf
ADD haproxy.cfg.ctmpl /etc/haproxy.cfg.ctmpl
ADD reload-haproxy.sh /usr/local/bin/reload-haproxy.sh
ADD run-haproxy.sh /usr/local/bin/run-haproxy.sh
ADD haproxy.ini /etc/supervisor.d/haproxy.ini
ADD consul-template.ini /etc/supervisor.d/consul-template.ini

# chmod
RUN chmod u+rx,go+r /usr/local/bin/consul-template
RUN chmod u+rx,go+r /usr/local/bin/run-haproxy.sh
RUN chmod u+rx,go+r /usr/local/bin/reload-haproxy.sh

# Command
CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisord.conf"]
