FROM phusion/passenger-ruby24

RUN apt-get update
RUN apt-get install -y tzdata

# enable Nginx and Passenger
RUN rm -f /etc/service/nginx/down \
  && rm /etc/nginx/sites-enabled/default

ADD config/webapp.conf /etc/nginx/sites-enabled/webapp.conf
# needed to set environmental variables in Nginx
ADD config/rails-env.conf /etc/nginx/main.d/rails-env.conf

# create and set working directory for app
WORKDIR /home/app/webapp

# add Gemfile and Gemfile.lock ahead of time in order
# to cache dependencies in a layer before app code is copied
COPY Gemfile /home/app/webapp
COPY Gemfile.lock /home/app/webapp

# set correct permissions for bundler to modify files as non-root user
RUN cd /home/app/webapp \
  && chown app:app Gemfile \
  && chown app:app Gemfile.lock

# update bundler and install gems as app user
USER app
RUN gem install bundler -v '1.15.4'
RUN bundle install

# copy application into the container and use right permissions: passenger
USER root
COPY . /home/app/webapp
RUN chown -R app:app /home/app/webapp

# clean up any tempory files from image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# use baseimage-docker's init process to start the rails app on passenger
CMD ["/sbin/my_init"]

# expose nginx port
EXPOSE 80
