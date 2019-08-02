FROM node:alpine as builder 

WORKDIR '/work'

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


FROM nginx

COPY --from=builder /work/build /usr/share/nginx/html
