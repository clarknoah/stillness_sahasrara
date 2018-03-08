FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ADD start.sh /start.sh

ADD wait-for.sh /wait-for.sh

EXPOSE 3000

CMD ["/start.sh"]

#CMD ["npm","start"]
