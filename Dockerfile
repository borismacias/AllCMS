FROM phusion/passenger-ruby24
MAINTAINER PantlessDev
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Enable Nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Add virtual host entry for the application. Make sure
# the file is in the correct path
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# In case we need some environmental variables in Nginx. Make sure
# the file is in the correct path
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf


ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install gems: it's better to build an independent layer for the gems
# so they are cached during builds unless Gemfile changes
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install -j4

# Copy application into the container and use right permi ssions: passenger
# uses the app user for running the application
RUN mkdir /home/app/webapp
COPY . /home/app/webapp
RUN usermod -u 1000 app
RUN chown -R app:app /home/app/webapp
WORKDIR /home/app/webapp

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

