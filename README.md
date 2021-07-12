# pooltogether
deploy backend and ui together

1. get your infura id from https://blog.infura.io/getting-started-with-infura-28e41844cc89/
2. get your alchemy api key from https://docs.alchemy.com/alchemy/introduction/getting-started
3. fill out the .envrc files with your infura id and alchemy api key in NEXT_JS_INFURA_ID and ALCHEMY_URL
maybe this was redundant?4. in development only, fill out the .envrc file with HDWALLET_MNEMONIC=test test test test test test test test test test test junk
5. copy .envrc files into pooltogether-pool-contracts, pooltogether-pool-builder-ui respectively
6. docker build -t pooltogether .
7. docker run (backend- yarn deploy rinkeby or kovan or testnets of your choice)
8. docker 2nd run (ui- yarn dev) can be multiple build in 1 Dockerfile
9. go to site mentioned by ui e.g. http://172.17.0.3:3000 to see builder-pooltogether.com ready to onboard users

