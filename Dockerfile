FROM ruby:latest
RUN apt-get update
RUN apt-get install -y vim mysql-server mysql-client --no-install-recommends

RUN gem install rails
RUN mkdir /home/data

RUN echo "[mysqld]" >> /etc/mysql/my.cnf
RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
RUN /etc/init.d/mysql start && sleep 5s && mysql -e "create user root@'%'" && mysql -e "grant all privileges on *.* to root@'%';" 

EXPOSE 3306
EXPOSE 3000
ADD init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
CMD ["/tmp/init.sh"]
