##
## ghcr.io/cruglobal-ai/ab-code-developer:master
##
## This is a collection of our github projects for a developer install.
## We use this upon install to copy over our repositories.
##
## Docker Commands:
## ---------------
## $ docker build -t ghcr.io/cruglobal-ai/ab-code-developer:master .
## $ docker push ghcr.io/cruglobal-ai/ab-code-developer:master
##

ARG BRANCH=master

FROM ghcr.io/cruglobal-ai/service-cli:${BRANCH}

# GitHub org to clone AppBuilder repos from (read by buildContainer.js)
ARG AB_GITHUB_ORG=CruGlobal-AI

RUN apt-get update \
    && apt-get install -y \
        bzip2

COPY . /app

# RUN rm /app/package-lock.json
# RUN rm -Rf /app/node_modules

WORKDIR /app

RUN npm i -f

RUN node buildContainer.js

RUN tar -cjf developer.tar.bz2 developer 

RUN rm -Rf developer

CMD [ "cp", "developer.tar.bz2", "/app/dest/." ]
