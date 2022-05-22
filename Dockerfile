FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm install -g @angular/cli
COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/dist/frontend /usr/share/nginx/html