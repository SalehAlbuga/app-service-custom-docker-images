
FROM node:10.15

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
        && apt-get install -y --no-install-recommends openssh-server \
        && echo "$SSH_PASSWD" | chpasswd 

# Install your custom dependencies
#RUN apt-get install -y --no-install-recommends <packages>

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh

# make a temp directory to build the project
RUN mkdir /site
ADD /reactapp /build
WORKDIR /build
RUN npm install
RUN npm run build

# move the output to another folder and clean
WORKDIR /site
RUN cp -r ../build/build /public
RUN rm -r ../build
ADD server.js .
ADD package.json .
RUN npm install

EXPOSE 8000 2222

#CMD ["node", "server.js"]
ENTRYPOINT ["init.sh"]
