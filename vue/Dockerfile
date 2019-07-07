
FROM node:10.15

LABEL maintainer="Saleh Albuga a-saalbu@microsoft.com"

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
        && apt-get install -y --no-install-recommends openssh-server \
        && echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh

# build the project in a temp directory
RUN mkdir /site
ADD /vueapp /build
WORKDIR /build
RUN npm install
RUN npm run build

# move the output to another folder and clean
WORKDIR /site
RUN cp -r ../build/dist /public
RUN rm -r ../build
ADD server.js .
ADD package.json .
RUN npm install

EXPOSE 8000 2222

#CMD ["node", "server.js"]
ENTRYPOINT ["init.sh"]
