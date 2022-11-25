FROM node:lts-alpine AS build

WORKDIR /Frontend
COPY . .
RUN npm install
RUN npm run build

FROM nginx:stable-alpine

COPY --from=build /Frontend/build /usr/share/nginx/html

EXPOSE 80
