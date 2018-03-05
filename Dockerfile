FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ADD start.sh /start.sh

EXPOSE 3000

CMD ["/start.sh"]
