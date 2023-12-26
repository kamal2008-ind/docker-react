From node:alpine as builder

WORKDIR '/app'

Copy package.json .

RUN npm install

Copy . .

RUN npm run build

From nginx
Copy --from=builder /app/build usr/share/nginx/html
