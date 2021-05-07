#!/bin/bash

env GO111MODULE=on 

# slit
go get -u github.com/tigrawap/slit/cmd/slit

# pistol
go get -u github.com/doronbehar/pistol/cmd/pistol
