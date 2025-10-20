# Use an official Nginx image
FROM nginx:latest

# Copy files into Nginx HTML directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run Nginx server
CMD ["nginx", "-g", "daemon off;"]
