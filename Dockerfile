# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

RUN npm ci

RUN npm install

COPY . .

RUN ionic init

RUN ionic build

EXPOSE 4200

FROM nginx:alpine

COPY --from=ionic /usr/src/app/www /usr/share/nginx/html
COPY --from=ionic /usr/src/app/www /bin