FROM node:14-alpine as build
RUN apk update && apk add bash
WORKDIR /usr/src/react-sample-app
ENV PATH /node_modules/.bin:$PATH

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install --silent

#To bundle your app’s source code inside the Docker image, use the COPY instruction:
COPY . .

#Your app binds to port 3000 so you’ll use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 3000

CMD ["npm", "start"]