FROM python:3.8-slim

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/

# ssh setup
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
        && apt-get install -y --no-install-recommends openssh-server build-essential \
        && echo "$SSH_PASSWD" | chpasswd 

# Install your custom dependencies
#RUN apt-get install -y --no-install-recommends <packages>

RUN pip install -r requirements.txt
ADD . /code/

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 8000 2222

ENTRYPOINT ["init.sh"]
