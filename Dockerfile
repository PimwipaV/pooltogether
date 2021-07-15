#!/bin/bash
FROM node:latest
RUN apt-get update && apt-get install -y \
    nano && \
    curl -sSL https://golang.org/dl/go1.16.4.linux-amd64.tar.gz \
	| tar -v -C /usr/local -xz

ENV PATH=$PATH:/usr/local/go/bin
#prepare go and direnv dependencies  
RUN git clone https://github.com/direnv/direnv.git && cd direnv && \
    make && \
    make install && \
    cd ../ && \
#clone pool contracts repo, compile
#have to add rinkeby to const networks in hardhat.networks.js inside the container
#have to check if direnv allow actually loads values from .envrc
#will have to deploy to rinkeby inside the container
    git clone https://github.com/pooltogether/pooltogether-pool-contracts.git && cd pooltogether-pool-contracts && \
    mkdir abis && \
    yarn && \
    yarn add @pooltogether/pooltogether-contracts && \
    yarn add --dev hardhat@^2.2.1 && \
#next, clone ui repo, and install dependencies
#will have to start app (yarn dev) inside the container
    cd ../ && \
    git clone https://github.com/pooltogether/pooltogether-pool-builder-ui.git && \
    cd pooltogether-pool-builder-ui && \
    yarn
