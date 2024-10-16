FROM node:lts

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

# Bundle app source
COPY src src
COPY tsconfig.json ./
COPY .eslintrc.cjs ./
COPY .prettierrc.json ./

RUN npm run build
RUN npm run lint

ARG PORT=3000
EXPOSE $PORT

RUN npm run test

CMD [ "npm", "start" ]
