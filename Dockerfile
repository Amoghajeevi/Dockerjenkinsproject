# Use Node.js as the base image
FROM node:14

# Create and set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Run the application
CMD ["node", "app.js"]
