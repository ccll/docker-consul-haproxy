#!/bin/sh

nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --buffer
supervisorctl restart haproxy
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --release-indefinite
