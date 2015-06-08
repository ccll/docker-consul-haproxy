FROM haproxy:1.5.11

# Install forego
ADD https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego /usr/local/bin/forego

# Install ccll/consul-template (a hacked version with support for customizable template delimeters)
ADD https://github.com/ccll/consul-template/releases/download/v0.7.0-1/consul-template /usr/local/bin/consul-template

# Install config files
ADD consul-template.conf /etc/consul-template.conf
ADD haproxy.cfg.ctmpl /etc/haproxy.cfg.ctmpl
ADD reload-haproxy.sh.ctmpl /usr/local/bin/reload-haproxy.sh.ctmpl
ADD run-haproxy.sh /usr/local/bin/run-haproxy.sh
ADD forego.proc /etc/forego.proc

# chmod
RUN chmod u+rx,go+r /usr/local/bin/consul-template
RUN chmod u+rx,go+r /usr/local/bin/forego
RUN chmod u+rx,go+r /usr/local/bin/run-haproxy.sh
RUN chmod u+rx,go+r /usr/local/bin/reload-haproxy.sh.ctmpl

# Command
CMD ["forego", "start", "-f", "/etc/forego.proc"]
