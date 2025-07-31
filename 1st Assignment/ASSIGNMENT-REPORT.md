# 🛡️ Ethical Hacking Assignments – Semester 3, 2025  
## **Assignment 2: Full Port Scan**  

**Student Name:** aadithyavimal-christ  
**Date Submitted:** 29/07/2025  
**Version:** 1.0  
**Target:** `testphp.vulnweb.com`  
**Repository:** `EH_sem3_2025_Notes/1st Assignment/`

---

## 🎯 Assignment Overview

This report documents the completion of **Assignment 2: Full Port Scan**, a critical component of the Ethical Hacking curriculum for Semester 3, 2025. The objective was to conduct a **comprehensive network reconnaissance** operation by scanning all **65,535 TCP ports** on the target system `testphp.vulnweb.com` using the `nmap -p-` command.

In real-world cybersecurity, attackers often hide services on non-standard ports (e.g., SSH on port 2222 or a backdoor on port 4444) to avoid detection by basic scans. A full port scan ensures that **no potential entry point is overlooked**, aligning with the principle of “no stone left unturned” in security auditing.

This assignment required:

- Performing a full port scan using `nmap`
- Automating the process with a Bash script
- Saving scan output for analysis and reporting
- Submitting a detailed 2–3 page report covering methodology, findings, and security insights

All activities were conducted in a secure, ethical environment using only authorized targets. No unauthorized systems were accessed.

---

## 📋 Methodology

### 1. Environment Setup

To ensure compatibility with Linux-based security tools, I used the **Windows Subsystem for Linux (WSL)** with **Ubuntu 22.04 LTS**. This provided a native Linux environment within Windows, enabling seamless use of command-line tools such as `nmap`, `bash`, and `chmod`.

**Tools Used:**
- `nmap` – Network scanner
- `bash` – Scripting and automation
- `VS Code` with **Remote - WSL** extension
- `nano` – Text editing within WSL

This setup mirrors professional cybersecurity workflows, where Linux-based systems are standard for penetration testing and system auditing.

### 2. Script Development and Automation

I developed a Bash script named `full_port_scan.sh` to automate the scanning process. The script ensures consistency, repeatability, and proper documentation — essential qualities in professional security assessments.

#### 🔧 Key Features of the Script:
- Defines the target: `testphp.vulnweb.com`
- Sets output filename: `nmap_full_scan_results.txt`
- Executes the full scan command:
  ```bash
  nmap -p- -sV --open -oN nmap_full_scan_results.txt testphp.vulnweb.com
  ```
  - `-p-`: Scan all 65,535 TCP ports  
  - `-sV`: Detect service names and software versions  
  - `--open`: Show only open (accessible) ports  
  - `-oN`: Save output in normal, human-readable format  

- Includes error handling to confirm successful execution
- Provides user feedback during runtime

Automation reduces human error and allows for future reuse in similar audits.

### 3. Execution Process

The following steps were performed to execute the scan:

```bash
cd ~/EH_sem3_2025_Notes/1st\ Assignment/
chmod +x full_port_scan.sh
./full_port_scan.sh
cat nmap_full_scan_results.txt
```

- The scan took ~22 minutes due to the number of ports scanned.
- Verified output was saved correctly and reviewed.

---

## 🖼️ Screenshots (Evidence of Work)


1.
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/4bed91d0-a6ca-44da-8bef-b7229bc28db1" />
– Code snippet showing bash file in VS Code

2. 
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/f32b83ec-a624-4cbc-8b9d-7d7ac4a04abf" />
– Terminal showing script execution  

3. 
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/0abb7e82-9f6a-4c7c-a308-ee1bc68e2f9e" />
– Output file displaying detected ports  

These images validate successful scan execution and deliverable submission.

---

## 🔍 Findings and Analysis

After scanning all 65,535 TCP ports, the following open services were identified:

| Port | State   | Service | Version         | Purpose                     |
|------|---------|---------|-----------------|-----------------------------|
| **80** | **Open** | **HTTP** | **nginx 1.19.0** | Main web application        |

- **Total Ports Scanned:** 65,535
- **Open Ports Found:** 1
- **Filtered Ports:** 65,534 (no response)
- **Closed Ports:** Likely many more, but not explicitly listed in the output.
- **Unusual or Hidden Services:** ❌ None detected

### 🔎 Detailed Observations

- **Port 80 (HTTP):** Hosts the main web application over **nginx 1.19.0**.
- **No Other Services:** Encrypted HTTPS (Port 443) was not detected in this scan.
- No services found on ports like 21 (FTP), 22 (SSH), 23 (Telnet), etc.
- Indicates a minimal attack surface and strong basic security hygiene. 

---

## ✅ Conclusions

### Why Full Port Scans Are Critical in Cybersecurity

A full port scan is more than a technical task — it represents the ethical hacker mindset: **assume nothing, verify everything**.

**Benefits:**
- **Avoiding Security Blind Spots:** Attackers check hidden ports like 4444, 5555, etc.
- **Detecting Misconfigurations:** Helps reveal unintentional exposures.
- **Compliance:** Meets standards like PCI-DSS, NIST, ISO 27001.
- **Red Teaming:** Simulates real-world adversary reconnaissance.
- **Attack Surface Reduction:** Helps organizations close unnecessary services.

Although no hidden services were found, confirming their **absence** is itself a key insight in professional penetration testing.

---

## 💻 Code: full_port_scan.sh

```bash
#!/bin/bash

# Full Port Scan Script
# Purpose: Scan all 65,535 TCP ports on testphp.vulnweb.com
# Author: aadithyavimal-christ
# Date: 29/07/2025

TARGET="testphp.vulnweb.com"
OUTPUT_FILE="nmap_full_scan_results.txt"

echo "[*] Starting full port scan on $TARGET..."
echo "[*] Scanning all 65,535 TCP ports. This may take 15–30 minutes..."
echo "[*] Command: nmap -p- -sV --open -oN $OUTPUT_FILE $TARGET"

# Run the nmap scan
nmap -p- -sV --open -oN "$OUTPUT_FILE" "$TARGET"

# Check if the scan completed successfully
if [ $? -eq 0 ]; then
    echo "[+] Scan completed successfully!"
    echo "[+] Results saved to '$OUTPUT_FILE'"
else
    echo "[-] Error: nmap scan failed."
    echo "[-] Possible causes: Network issue, nmap not installed, or target unreachable."
fi
```
