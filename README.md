# 🔐 Password Security Audit Toolkit

An ethical password auditing & simulation toolkit written in **Bash**.

This project is designed for **educational use**, **internal security audits**, and **defensive security training**. It simulates common password attack techniques **without performing real cracking**, helping teams understand password weaknesses and improve overall security posture.

---

## ⚠️ Ethical Use Only

This tool is intended **only** for systems you own or have **explicit permission** to test.  
Unauthorized use against third-party systems is **illegal** and unethical.

---

## 📌 Features Overview

- ✔ Dictionary-based password mutation  
- ✔ Hash format identification (simulation)  
- ✔ Password strength analysis  
- ✔ Brute-force time estimation  
- ✔ Automated audit report generation  

---
## 📁 Project Structure
```
password-audit-suite/
│── audit.sh              # Main Bash script
├── input/
│   ├── passwords.txt     # Sample passwords for analysis
│   └── hashes.txt        # Sample hashes for identification
│
├── output/
│   ├── wordlist.txt             # Generated password dictionary
│   ├── analysis.txt             # Technical analysis output
│   └── report.txt               # Final audit report
│
└── README.md                    # Project documentation
```
---
## ⚙️ Requirements

- **Linux** or **macOS**
- **Bash 4+**
- **bc** (used for mathematical calculations)

### 📦 Install `bc` if missing

```bash
# Debian / Ubuntu
sudo apt install bc

# macOS (Homebrew)
brew install bc
```
---
## 🚀 Usage

### 📥 Clone the Repository

```bash
git clone https://github.com/yourusername/password-security-audit-toolkit.git
cd password-security-audit-toolkit
```
---
### 📂 Prepare Input Files

Ensure the following input files are available before running the toolkit:

- `input/passwords.txt`
- `input/hashes.txt`
---
### Make the script executable
```bash
chmod +x audit.sh
```
### Run the audit
```bash
./audit.sh
```
### Review results
```bash
output/report.txt
```
---
## 🧠 Module Breakdown

### 🔹 Module 1: Dictionary Generator

**Purpose:**  
Simulates real-world password mutation techniques commonly used in dictionary attacks.

**Techniques Used:**

- Numeric suffixes (e.g., `password123`)
- Symbol substitution (e.g., `password@`)
- Capitalization (e.g., `Password`)
- Leetspeak substitutions (e.g., `a → @`, `e → 3`)

**Output:**

- `output/wordlist.txt`

### 🔹 Module 2: Hash Identification (Simulation)

**Purpose:**  
Identifies likely hash algorithms based on format and length.

**Detected Types:**

- SHA-512 (Linux Shadow `$6$`)
- MD5 (32 characters)
- SHA-1 (40 characters)
- SHA-256 (64 characters)

**Note:**  
No cracking is performed — identification only.

---

### 🔹 Module 3: Password Strength Analyzer

**Purpose:**  
Evaluates password complexity using common security criteria.

**Scoring Factors:**

- Length ≥ 8
- Uppercase letters
- Lowercase letters
- Numbers
- Symbols

**Strength Levels:**

- Very Weak
- Weak
- Medium
- Strong
- Very Strong

---

### 🔹 Module 4: Brute-Force Time Estimation

**Purpose:**  
Estimates how long a brute-force attack could take under assumed conditions.

**Assumptions:**

- Character set: `a-z A-Z 0-9` (62 characters)
- Attempt rate: `1,000,000` guesses/sec

**Lengths Tested:**

- 6 characters
- 8 characters
- 10 characters

---

### 🔹 Module 5: Report Generation

**Purpose:**  
Combines all analysis results into a professional audit report.

**Includes:**

- Hash identification results
- Password strength ratings
- Brute-force time estimates
- Security recommendations

**Output:**

- `output/report.txt`

---

## 📄 Sample Report Sections

## PASSWORD SECURITY AUDIT REPORT
--------------------------------
### 🔍 Audit Sections

- Hash Identification Results
- Password Strength Analysis
- Brute-force Time Estimation

---

## 🔐 Security Recommendations

- Enforce passwords **≥ 12 characters**
- Require **mixed character sets**
- Implement **rate limiting & account lockout policies**
- Use **modern password hashing algorithms** (bcrypt / Argon2)

## 🛡️ Security & Ethical Notice

This project:

- ❌ Does **NOT** perform real password cracking  
- ❌ Does **NOT** attack live systems  
- ✅ Is safe for labs, demos, and learning environments  

**Use responsibly.**

---

## 📜 License

**MIT License**  
Use freely for education, research, and internal security audits.




