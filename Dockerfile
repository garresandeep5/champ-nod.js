# Use Node.js Alpine as base image
FROM node:alpine

# Switch to root user to install system packages
USER root

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Install stress testing tool
RUN apk update && apk add --no-cache stress

# Copy application files
COPY . .

# Expose application port
EXPOSE 5000

# Set default user back to node
USER node

# Start application
CMD [ "node", "index.js" ]
