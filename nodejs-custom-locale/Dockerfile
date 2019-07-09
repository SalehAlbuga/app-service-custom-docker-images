
FROM node:10.15

LABEL maintainer="Saleh Albuga a-saalbu@microsoft.com"

RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN npm install

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
        && apt-get install -y --no-install-recommends openssh-server \
        && echo "$SSH_PASSWD" | chpasswd 

# install locales
RUN apt-get install locales -y --no-install-recommends dialog
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 8000 2222

#CMD ["node", "server.js"]
ENTRYPOINT ["init.sh"]
