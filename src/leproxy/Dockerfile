# Use the official NGINX image as the base image
FROM nginx:1.25.5-perl

# Remove the default NGINX configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Install gettext package for envsubst command
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Copy the NGINX configuration file
COPY src/leproxy/nginx.conf /etc/nginx/

RUN mkdir -p /var/www/leenedge/

WORKDIR /var/www/leenedge/

# Expose ports
EXPOSE 80
EXPOSE 443