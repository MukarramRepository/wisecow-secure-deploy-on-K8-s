FROM ubuntu:20.04

# Install dependencies (including netcat)
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

# Set working directory
WORKDIR /app

# Copy the script
COPY wisecow/wisecow.sh .

# Make it executable
RUN chmod +x /app/wisecow.sh

# Expose the port (optional but good practice)
EXPOSE 4499

# Run the script
CMD ["/app/wisecow.sh"]
