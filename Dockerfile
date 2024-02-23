# Use a base image with wget and tar
FROM alpine:latest

# Set working directory
WORKDIR /app

# Download and extract the Bombsquad server
RUN wget https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_1.7.33.tar.gz && \
    tar -xzvf BombSquad_Server_Linux_x86_64_1.7.33.tar.gz && \
    rm BombSquad_Server_Linux_x86_64_1.7.33.tar.gz

# Expose the UDP port
EXPOSE 43210/udp

# Command to run the server
CMD ["./bombsquad_server"]
