FROM haproxy:1.5.11

# Install forego
ADD https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego /usr/local/bin/forego

# Install ccll/consul-template (a hacked version with support for customizable template delimeters)
ENV CONSUL_TEMPLATE_VERSION 0.7.0-1
RUN cd /tmp && \
    wget --no-check-certificate https://github.com/ccll/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    tar xzf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    mv consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64/consul-template /usr/local/bin/consul-template && \
    rm -rf /tmp/*
