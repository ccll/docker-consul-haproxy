FROM haproxy:1.5.11

# Install forego
ADD https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego /usr/local/bin/forego

# Install ccll/consul-template (a hacked version with support for customizable template delimeters)
ADD https://github.com/ccll/consul-template/releases/download/v0.7.0-1/consul-template /usr/local/bin/consul-template
