#!/bin/bash

trap : TERM INT
cat /app/td-agent-bit.conf.template | gomplate -o /etc/td-agent-bit/td-agent-bit.conf
/opt/td-agent-bit/bin/td-agent-bit -c /etc/td-agent-bit/td-agent-bit.conf
