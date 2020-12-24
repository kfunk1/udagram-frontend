# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./
COPY ionic.config.json ./

RUN npm ci

RUN npm install

COPY . .

EXPOSE 4200

FROM nginx:alpine
