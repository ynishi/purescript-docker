FROM node:11.4.0-stretch-slim

ENV YARNHOME /home/node/yarn
ENV APPHOME /home/node/app
ENV PATH $PATH:$YARNHOME/bin

RUN set -eux; \
  mkdir -p $YARNHOME/bin $APPHOME \
  && chown -R node:node ~node \
  && apt-get update \
  && apt-get install git -y \
  && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR $APPHOME
RUN set -eux; \
  yarn global add --prefix $YARNHOME \
    purescript \
    pulp \
    psc-package \
  && pulp --version \
  && psc-package --version

VOLUME [$APPHOME]

CMD ["pulp", "run"]
