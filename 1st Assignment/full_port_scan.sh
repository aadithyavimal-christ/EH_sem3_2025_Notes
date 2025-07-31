#!/bin/bash

# Assignment 2: Full Port Scan
# Target: testphp.vulnweb.com
# Purpose: Scan all 65,535 ports to detect hidden services
# Author: aadithyavimal-christ

TARGET="testphp.vulnweb.com"
OUTPUT_FILE="nmap_full_scan_results.txt"

echo "[*] Starting full port scan on $TARGET..."
echo "[*] Scanning all 65,535 ports. This may take several minutes..."
echo "[*] Running: nmap -p- -sV --open -oN $OUTPUT_FILE $TARGET"

# Perform full port scan (all ports), detect service versions, save output
nmap -p- -sV --open -oN "$OUTPUT_FILE" "$TARGET"

# Check if scan completed
if [ $? -eq 0 ]; then
    echo "[+] Scan completed successfully!"
    echo "[+] Results saved to '$OUTPUT_FILE'"
else
    echo "[-] Error during scan. Check your network or nmap installation."
fi
