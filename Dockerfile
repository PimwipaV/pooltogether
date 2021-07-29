#!/bin/bash
FROM node:latest
RUN apt-get update && apt-get install -y \
    nano && \
# prepare go and direnv dependencies  
    curl -sSL https://golang.org/dl/go1.16.4.linux-amd64.tar.gz \
	| tar -v -C /usr/local -xz
ENV PATH=$PATH:/usr/local/go/bin
RUN git clone https://github.com/direnv/direnv.git && cd direnv && \
    make && \
    make install && \
    cd ../ && \
# clone pool contracts repo, compile, and deploy to rinkeby 
    git clone https://github.com/pooltogether/pooltogether-pool-contracts.git && \
    cd pooltogether-pool-contracts && \
    mkdir abis && \
    yarn && \
    yarn add --dev hardhat@^2.2.1 && \
    #cd pooltogether-pool-contracts && \
    sed -i '12s/}/}, rinkeby:{chainId: 4, url:process.env.ALCHEMY_URL}/g' hardhat.networks.js && \
    touch .envrc && \
    echo "export ALCHEMY_URL=https://eth-rinkeby.alchemyapi.io/v2/dvLtTWZJYtqhryOqy6bLkfybk9QquMfM" >> .envrc && \
    direnv allow && \
    eval $(direnv export bash) && \
    #yarn deploy rinkeby
# next, clone ui repo, and start app
    cd ../ && \
    git clone https://github.com/pooltogether/pooltogether-pool-builder-ui.git && \
    cd pooltogether-pool-builder-ui && \
    yarn
RUN cd pooltogether-pool-builder-ui && \
    touch .envrc && \
    echo "NEXT_JS_INFURA_ID=016e5386648343c2aa508b266b49cb0e" >> .envrc && \
    echo "NEXT_JS_DEFAULT_ETHEREUM_NETWORK_NAME=rinkeby" >> .envrc && \
    echo "NEXT_JS_DOMAIN_NAME=pooltogether.com" >> .envrc && \
    echo "INFURA_API_KEY=016e5386648343c2aa508b266b49cb0e" >> .envrc && \
    direnv allow && \
    eval $(direnv export bash)
    #yarn dev 
