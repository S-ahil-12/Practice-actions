FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy your application code
COPY . .

# Build stage (assuming your build process creates files in /dist)
RUN npm run build  # Replace with your actual build command

# Final nginx image
FROM nginx:latest

# Copy default configuration (optional, adjust as needed)
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

# Use the built application from the builder stage
COPY .  /usr/share/nginx/html


ENTRYPOINT ["npm", "start"]
