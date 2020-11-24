FROM node:12-alpine

RUN apk update \
    && apk add curl

WORKDIR /usr/src/web

COPY --chown=node:node . .

RUN npm ci \
    && npm run build

EXPOSE 5000

CMD ["node", "server/index.js"]

USER node