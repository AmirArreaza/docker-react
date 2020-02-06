FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#Every phase has only one FROM statement
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Nginx will execute by the default command in the image