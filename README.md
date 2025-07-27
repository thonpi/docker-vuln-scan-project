# 🔐 Docker Multi-Round Vulnerability Scanning Project

This project demonstrates a multi-round vulnerability scanning workflow for Docker containers using a combination of open-source security tools and Snyk for commercial-grade comparison.

## 📦 Project Structure

```
docker-vuln-scan-project/
├── Dockerfile # Insecure test image
├── app.py # Minimal Flask app
├── .env # Fake secrets for testing
├── scan.sh # Automated scanning script
├── results/ # Output from all tools
└── snyk_report/ # Snyk CLI or dashboard outputs
```

## 🔍 Tools Used

```

| Tool       | Purpose                                  |
|------------|------------------------------------------|
| Trivy      | OS & package CVE scanning                |
| Grype      | SBOM-based dependency vulnerability scan |
| Dockle     | Docker image configuration checks        |
| Gitleaks   | Hardcoded secret detection               |
| Hadolint   | Dockerfile best practices / linting      |
| Snyk       | Unified commercial scanner with fixes    |

```

## ⚙️ How to Use

### 1. Build the Test Docker Image
```bash
docker build -t my-insecure-app .
```
### 2. Run the Scanning Script
```bash
chmod +x scan.sh
./scan.sh
```
### 3. View the Results
Check the results/ folder for output from all scanners:

```
trivy.txt

grype.txt

dockle.txt

hadolint.txt

gitleaks.json

```

### 🧪 Vulnerabilities Simulated

```
- Outdated Flask version (1.0) with known CVEs

- No HEALTHCHECK or USER directive

- Secrets in .env file (e.g., fake GitHub token)

- Missing best practices in Dockerfile

```

### Snyk Scan & Comparison
Run Snyk for unified scanning and fix suggestions:

```bash
snyk container test my-insecure-app
```

Optionally:

```bash
snyk container monitor my-insecure-app
```

### 📌 Key Learnings
```

- Multi-round scanning provides full-layer visibility.

- Open-source tools are powerful when used together.

- Snyk simplifies scanning and remediation.

- Security should be part of CI/CD, not an afterthought.

```

### 📜 License
This project is for educational purposes only.