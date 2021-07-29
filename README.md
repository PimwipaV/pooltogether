# pooltogether
deploy backend and ui together

1. get your infura id from https://blog.infura.io/getting-started-with-infura-28e41844cc89/
2. get your alchemy api key from https://docs.alchemy.com/alchemy/introduction/getting-started
3. fill out the files backend/.envrc and ui/.envrc with your infura id and alchemy api key in NEXT_JS_INFURA_ID and ALCHEMY_URL
4. in development only, fill out the .envrc file with HDWALLET_MNEMONIC=test test test test test test test test test test test junk

#.envrc can be made locally before docker build
#then to copy .envrc files into pooltogether-pool-contracts, pooltogether-pool-builder-ui respectively is done inside Dockerfile

5. docker build -t pooltogether .
(both backend and ui and be run by 1 docker run command
docker run (backend- yarn deploy rinkeby or kovan or testnets of your choice) as well as (ui- yarn dev) to launch the app

#just one docker run then it's done

6. docker run -it -v ${PWD}:/home pooltogether:latest
8. go to site mentioned by ui e.g. http://172.17.0.3:3000 to see builder-pooltogether.com ready to onboard users

