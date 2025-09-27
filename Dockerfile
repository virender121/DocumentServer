FROM onlyoffice/documentserver:latest

# Set working directory
WORKDIR /var/www/onlyoffice

# Set JWT secret (can also override in Render dashboard)
ENV JWT_SECRET=071:EIr/KA;C6&tPcY6=?f/Bp:zTs4O*

# Create folders to avoid missing directory warnings
RUN mkdir -p /var/www/onlyoffice/Data/certs \
    && mkdir -p /var/log/onlyoffice

# Expose port (Render requires this)
EXPOSE 80

# Start Document Server in foreground and redirect to Render $PORT
CMD service ds-documentserver start && \
    # Use socat to forward internal port 80 to Render $PORT
    apt-get update && apt-get install -y socat && \
    socat TCP-LISTEN:${PORT},fork TCP:127.0.0.1:80
