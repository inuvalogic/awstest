FROM ubuntu
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

ADD package.json /tmp/package.json
RUN cd /tmp && npm install --production
RUN mkdir -p /var/app/current && cp -a /tmp/node_modules /var/app/current/

WORKDIR /var/app/current
ADD . /var/app/current

#COPY . /var/app/current
#RUN npm install --production
#RUN npm cache clean && npm install --production && npm install passport-ldapjs

ENV NODE_ENV production
EXPOSE 3000
CMD ["npm", "start"]