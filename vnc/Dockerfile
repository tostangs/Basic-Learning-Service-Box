# Use the Ubuntu 16:04 base image
FROM ubuntu:16.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server sudo

# Update packages and install SSH server
RUN apt-get update && \
    apt install -y ubuntu-desktop 

RUN sudo apt install -y \ 
        tightvncserver \
        gnome-panel \ 
        gnome-settings-daemon \ 
        metacity \ 
        nautilus \ 
        gnome-terminal \ 
        nano


# Create the SSH directory and configure permissions
RUN mkdir /var/run/sshd

# Add a new user 'dockeruser' and set a password
RUN useradd -m -s /bin/bash dockeruser && \
    echo 'dockeruser:YOUR_PASSWORD_HERE' | chpasswd

# Optional: Add the user to the sudoers to allow administrative actions
RUN echo 'dockeruser ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/dockeruser && \
    chmod 0440 /etc/sudoers.d/dockeruser

# Enable password authentication in the SSH configuration
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Optional: Disable root login via SSH
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22
EXPOSE 1
EXPOSE 5901

# Run the SSH server    
CMD ["/usr/sbin/sshd", "-D"]

# Start SSH and VNC services
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]