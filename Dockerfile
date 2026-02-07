FROM node:20
WORKDIR /8byte
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]