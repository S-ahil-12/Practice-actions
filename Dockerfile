FROM nginx:latest

# Copy default configuration (optional, adjust as needed)
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port (optional, adjust based on your application)
EXPOSE 80

# Use the built application from the builder stage
COPY  ./dist /usr/share/nginx/html

