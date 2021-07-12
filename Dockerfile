#!/bin/bash
FROM node:latest
    
RUN apt-get update && apt-get install -y \
    nano && \
    curl -sSL https://golang.org/dl/go1.16.4.linux-amd64.tar.gz \
	| tar -v -C /usr/local -xz

ENV PATH=$PATH:/usr/local/go/bin

RUN git clone https://github.com/direnv/direnv.git && cd direnv \
    #git fetch && git checkout 729fbecd96f3e827575f19497bc01df33395d679
    make && \
    make install && \
    cd ../ && \
    git clone https://github.com/pooltogether/pooltogether-pool-contracts.git && cd pooltogether-pool-contracts && \
    yarn && \
    yarn add @pooltogether/pooltogether-contracts && \
    yarn add --dev hardhat@^2.2.1 && \
    mkdir /abis
    #yarn hardhat node
    #yarn start