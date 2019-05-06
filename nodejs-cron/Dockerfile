
FROM node:10.15

RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN npm install

# ssh setup
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/



# Cron setup
RUN apt-get -y install cron
# Copy hello-cron file to the cron.d directory
COPY my-cron /etc/cron.d/my-cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/my-cron
# Apply cron job
RUN crontab /etc/cron.d/my-cron
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log



RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 8000 2222

#CMD ["node", "server.js"]
ENTRYPOINT ["init.sh"]
