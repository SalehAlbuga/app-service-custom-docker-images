
FROM ruby:2.6

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

RUN mkdir /code
WORKDIR /code
ADD . /code/

RUN gem install bundler
RUN bundle install
RUN rake db:create && rake db:migrate

EXPOSE 8000 2222

#CMD ["rails", "s"]
ENTRYPOINT ["init.sh"]
