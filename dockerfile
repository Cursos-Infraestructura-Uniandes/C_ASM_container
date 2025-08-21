# Dockerfile with Clang, VS Code (web), a fixed password, and 32-bit libraries
FROM ubuntu:22.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install system dependencies, Clang compiler, and 32-bit libraries
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    sudo \
    build-essential \
    clang \
    gcc-multilib \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*


# Configure SSH server
RUN mkdir /var/run/sshd
# Generate SSH host keys
RUN ssh-keygen -A 

#RUN useradd -m -s /bin/bash testing && \
#    echo 'testing:testing' | chpasswd 

# 2. Create a non-root user for development
# Add a password for the local access from the env arguments
ARG PASSWORD 
ENV PASSWORD ${PASSWORD}
RUN useradd -m -s /bin/bash -G sudo developer && \
    echo "developer:${PASSWORD}" | chpasswd && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 3. Install Node.js (required by code-server) and code-server itself
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs
RUN curl -fsSL https://code-server.dev/install.sh | sh

# 4. Create the directory and assing the user 
RUN mkdir -p /home/developer/work && chown -R developer:developer /home/developer

# 5. Switch to the developer user and configure the environment
USER developer
WORKDIR /home/developer/work
# Generate SSH host keys for developer user
RUN ssh-keygen -A 

# Copy example source files into the container
COPY --chown=developer:developer uniqueServer/initialFiles/main.c .
COPY --chown=developer:developer uniqueServer/initialFiles/README.md .

# 8. Expose the port and set the start command with a fixed password
EXPOSE 8080 22

# Start script: generate keys at runtime, then start sshd and code-server in background
CMD ["sh", "-c", "sudo /usr/bin/ssh-keygen -A && sudo /usr/sbin/sshd -D & code-server --bind-addr 0.0.0.0:8080 --auth password ."]



