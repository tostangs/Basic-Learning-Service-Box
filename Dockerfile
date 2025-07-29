FROM ubuntu:latest

# Update && add Serverside related packages
RUN apt-get update && apt-get install -y \
    apache2 \
    less \
    tree \
    vim \
    curl \
    net-tools \
    iputils-ping \
    procps \
    htop \
    man \
    sudo \
    bash-completion \
    systemd \
    && apt-get clean

# Add Hello world html file & expose port 80
ADD index.html /var/www/html/
EXPOSE 80

# Start apache
CMD /usr/sbin/apache2ctl -D FOREGROUND