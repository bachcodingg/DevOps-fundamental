# Use nginx as base image for serving static files
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy website files to nginx html directory
COPY assets/ /usr/share/nginx/html/assets/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/
COPY *.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx server (uses default configuration)
CMD ["nginx", "-g", "daemon off;"]
