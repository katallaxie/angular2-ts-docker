# To build and run with Docker:
#
#  $ docker build -t angular2-ts .
#  $ docker run -it --rm angular2-ts
#
FROM node:latest

# the port to access the BrowserSync
EXPOSE 8080 8081

# init user
RUN mkdir -p /app /tmp /home/nodejs && \
    groupadd -r nodejs && \
    useradd -u 1000 -r -g nodejs -d /home/nodejs -s /sbin/nologin nodejs && \
    chown -R nodejs:nodejs /home/nodejs && \
    chown -R nodejs:nodejs /app

# global dependencies
RUN npm i --unsafe-perm=true -g grunt-cli \
  typings \
  live-server \
  karma \
  nightwatch \
  typescript

# setting up modules
COPY payload/package.json payload/typings.json payload/run.sh  /tmp/
RUN cd /tmp && \
  npm install --unsafe-perm=true && \
  chown -R nodejs:nodejs /tmp && \
  chmod a+x /tmp/run.sh

# the application folder
WORKDIR /app

# the user in the docker
USER nodejs

# command to be run on inital start
CMD ["/tmp/run.sh"]
