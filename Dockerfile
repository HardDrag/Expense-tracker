FROM node:alpine as builder
ENV NODE_OPTIONS=--openssl-legacy-provider
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
RUN npm i --save @fortawesome/fontawesome-svg-core
RUN npm install --save @fortawesome/free-solid-svg-icons
RUN npm install --save @fortawesome/react-fontawesome
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'