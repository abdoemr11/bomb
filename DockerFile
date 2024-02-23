# Use a Python base image
FROM python:3

# Set working directory
WORKDIR /app

# Copy the app files into the container
COPY . .

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install necessary packages for different platforms
RUN wget https://github.com/bombsquadgame/bombsquad/releases/download/1.6.0/Vc_redist.x64.exe -P /app/dist/

# Expose the UDP port
EXPOSE 43210/udp

# Command to run the server
CMD ["./bombsquad_server"]
