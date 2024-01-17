# Use the Ubuntu base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    squid \
    apache2-utils

# Create a user for basic authentication
RUN htpasswd -b -c /etc/squid/passwd username password

# Copy the Squid configuration file
COPY squid.conf /etc/squid/squid.conf

# Expose the Squid port
EXPOSE 3128

# Run Squid
CMD ["/usr/sbin/squid", "-N", "-d", "1"]