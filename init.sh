#!/bin/bash

cd /var/lib/mysql
mv mysql /home/data/
ln -s /home/data/mysql mysql
/etc/init.d/mysql stop
/etc/init.d/mysql start

cd /home/data/rails
bundle install --path=vendor/bundle

rake db:create
