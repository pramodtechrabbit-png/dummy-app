# Use official Nginx image
FROM nginx:alpine

# Copy index.html into nginx html folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80