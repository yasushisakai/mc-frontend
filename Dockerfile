FROM node:alpine as build
WORKDIR /usr/mc-frontend
COPY package.json package-lock.json .
RUN npm install
COPY . .
RUN npm run build

FROM alpine
COPY --from=build /usr/mc-frontend/build /usr/mc-frontend/build

