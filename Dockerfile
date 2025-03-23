# Base image
FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y nginx

# Copy application files
COPY index.html /var/www/html/

# Expose port
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
