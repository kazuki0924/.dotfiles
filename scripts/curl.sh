#!/bin/bash

# nnn_plugins:
curl -sL https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | bash

# air
curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
