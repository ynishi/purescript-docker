FROM node:latest

ENV YARNHOME /home/node/yarn
ENV APPHOME /home/node/app
ENV PATH $PATH:$YARNHOME/bin

RUN set -eux; \
  mkdir -p $YARNHOME/bin $APPHOME \
  && chown -R node:node ~node

USER node
WORKDIR $APPHOME
RUN set -eux; \
  yarn global add --prefix $YARNHOME \
    purescript \
    pulp \
    bower \
  && pulp --version \
  && pulp init

VOLUME [$APPHOME]

CMD ["pulp", "run"]
