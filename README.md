# pooltogether
deploy backend and ui together

1. get your infura id from https://blog.infura.io/getting-started-with-infura-28e41844cc89/
2. get your alchemy api key from https://docs.alchemy.com/alchemy/introduction/getting-started
3. fill out your ALCHEMY_URL, NEXT_JS_INFURA_ID, INFURA_API_KEY in Dockerfile (the last 2 are the same just to make sure nextjs understands it)
4. docker build -t pooltogether .
5. docker run -it --env-file=.envrc pooltogether:latest bash
6. cd pooltogether-pool-contracts and then yarn deploy rinkeby
7. cd ../pooltogether-pool-builder-ui and then yarn dev
8. go to the site mentioned e.g. http://172.17.0.3:3000 to see builder-pooltogether.com ready to onboard users with list of wallets

