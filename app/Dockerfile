################################################################################
FROM node:8-alpine as build

# prepare working directory
RUN mkdir -p /app
WORKDIR /app

# install modules
COPY ./package.json          /app/package.json
COPY ./yarn.lock             /app/yarn.lock

RUN yarn install

# build application
COPY ./src                   /app/src
COPY ./.babelrc              /app/.babelrc

RUN npm run build

################################################################################
FROM node:8-alpine as runtime

# prepare working directory
RUN mkdir -p /app
WORKDIR /app

# copy modules
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/node_modules /app/node_modules

# copy application
COPY --from=build /app/build/backend /app/build/backend
COPY --from=build /app/src/frontend  /app/src/frontend

# run application
CMD [ "npm", "start" ]

EXPOSE 8888
