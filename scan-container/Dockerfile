FROM ubuntu:22.04

# Install common dependencies
RUN apt-get update && apt-get install -y \
    curl wget gnupg git bash python3-pip nodejs npm unzip lsb-release apt-transport-https ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Trivy from official repo (correct and up-to-date)
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor -o /usr/share/keyrings/trivy.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -cs) main" > /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && apt-get install -y trivy \
    && rm -rf /var/lib/apt/lists/*

# Install Grype (Anchore) via official install script
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# Install Dockle
RUN curl -sL https://github.com/goodwithtech/dockle/releases/download/v0.4.14/dockle_0.4.14_Linux-64bit.tar.gz | tar xz \
    && mv dockle /usr/local/bin/ \
    && chmod +x /usr/local/bin/dockle

# Install Hadolint (latest release)
RUN wget -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 \
    && chmod +x /usr/local/bin/hadolint

# Install Gitleaks (latest Linux x64 release)
RUN GITLEAKS_URL=$(curl -s https://api.github.com/repos/gitleaks/gitleaks/releases/latest | \
      grep "browser_download_url" | \
      grep "linux_x64.tar.gz" | \
      cut -d '"' -f 4) && \
    curl -sL $GITLEAKS_URL -o gitleaks.tar.gz && \
    tar -xzf gitleaks.tar.gz && \
    mv gitleaks /usr/local/bin/gitleaks && \
    chmod +x /usr/local/bin/gitleaks && \
    rm gitleaks.tar.gz

CMD ["bash"]
