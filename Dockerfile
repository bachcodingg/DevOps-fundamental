# Future Dockerfile with nginx.conf (use this later for optimization)
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY assets/ /usr/share/nginx/html/assets/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/
COPY *.html /usr/share/nginx/html/
COPY favicon.ico /usr/share/nginx/html/ 2>/dev/null || true

# Copy custom nginx configuration (OPTIONAL)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
