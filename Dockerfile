# Use official ONLYOFFICE DocumentServer image
FROM onlyoffice/documentserver:latest



# Optional: set a working directory
WORKDIR /var/www/onlyoffice

# Expose port 80
EXPOSE 80

# Set environment variable for JWT (required for integration)
ENV JWT_SECRET=071:EIr/KA;C6&tPcY6=?f/Bp:zTs4O*

# Create folders to avoid missing directory warnings
RUN mkdir -p /var/www/onlyoffice/Data/certs \
    && mkdir -p /var/log/onlyoffice

# Start the Document Server service
CMD ["service", "ds-documentserver", "start"] && tail -f /dev/null