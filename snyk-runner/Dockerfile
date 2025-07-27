FROM node:22-alpine

# Install snyk CLI globally
RUN npm install -g snyk

# --- INSTALL DOCKER CLI FROM ALPINE REPOSITORIES ---

# Step 1: Install 'docker-cli' along with other necessary packages
# 'ca-certificates' is good to ensure, 'unzip' and 'file' are not strictly needed for this method.
RUN apk add --no-cache docker-cli ca-certificates

# --- END DOCKER CLI INSTALLATION ---

WORKDIR /app

# Copy your scan script
COPY scan.sh /app/scan.sh
RUN chmod +x /app/scan.sh

ENTRYPOINT ["/app/scan.sh"]