FROM ruby:latest
RUN apt-get update
RUN apt-get install -y vim mysql-server mysql-client --no-install-recommends

RUN gem install rails
RUN mkdir /home/data

EXPOSE 3000
ADD init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
CMD ["/tmp/init.sh"]
