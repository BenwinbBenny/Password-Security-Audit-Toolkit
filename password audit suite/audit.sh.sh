#!/bin/bash
# =====================================================
# Password Cracking & Credential Attack Suite
# Ethical Password Audit & Simulation Tool
# =====================================================

# -----------------------------
# Directory Configuration
# -----------------------------
INPUT_DIR="input"
OUTPUT_DIR="output"

WORDLIST_FILE="$OUTPUT_DIR/wordlist.txt"
ANALYSIS_FILE="$OUTPUT_DIR/analysis.txt"
REPORT_FILE="$OUTPUT_DIR/report.txt"

mkdir -p "$OUTPUT_DIR"

# -----------------------------
# Banner
# -----------------------------
echo "============================================"
echo " Password Security Audit Toolkit"
echo " Ethical Simulation Mode Enabled"
echo "============================================"

# =====================================================
# MODULE 1: Dictionary Generator
# =====================================================
generate_dictionary() {

    echo "[+] Starting Dictionary Generation..."
    > "$WORDLIST_FILE"

    while read -r word
    do
        echo "$word"           >> "$WORDLIST_FILE"
        echo "${word}123"      >> "$WORDLIST_FILE"
        echo "${word}@"        >> "$WORDLIST_FILE"
        echo "${word^}"        >> "$WORDLIST_FILE"
        echo "${word/a/@}"     >> "$WORDLIST_FILE"
        echo "${word/e/3}"     >> "$WORDLIST_FILE"
    done < "$INPUT_DIR/passwords.txt"

    sort -u "$WORDLIST_FILE" -o "$WORDLIST_FILE"

    echo "[✓] Dictionary created at: $WORDLIST_FILE"
}

# =====================================================
# MODULE 2: Hash Identification (Simulation)
# =====================================================
identify_hashes() {

    echo "[+] Identifying hash formats..."
    echo "HASH IDENTIFICATION RESULTS" > "$ANALYSIS_FILE"
    echo "----------------------------" >> "$ANALYSIS_FILE"

    while read -r hash
    do
        hash_length=${#hash}

        if [[ $hash == *"\$6\$"* ]]; then
            echo "$hash → SHA-512 (Linux Shadow)" >> "$ANALYSIS_FILE"

        elif [[ $hash_length -eq 32 ]]; then
            echo "$hash → MD5 (Possible)" >> "$ANALYSIS_FILE"

        elif [[ $hash_length -eq 40 ]]; then
            echo "$hash → SHA-1 (Possible)" >> "$ANALYSIS_FILE"

        elif [[ $hash_length -eq 64 ]]; then
            echo "$hash → SHA-256 (Possible)" >> "$ANALYSIS_FILE"

        else
            echo "$hash → Unknown Format" >> "$ANALYSIS_FILE"
        fi
    done < "$INPUT_DIR/hashes.txt"

    echo "[✓] Hash identification completed"
}

# =====================================================
# MODULE 3: Password Strength Analyzer
# =====================================================
analyze_password_strength() {

    echo "" >> "$ANALYSIS_FILE"
    echo "PASSWORD STRENGTH ANALYSIS" >> "$ANALYSIS_FILE"
    echo "---------------------------" >> "$ANALYSIS_FILE"

    while read -r password
    do
        score=0

        [[ ${#password} -ge 8 ]] && ((score++))
        [[ "$password" =~ [A-Z] ]] && ((score++))
        [[ "$password" =~ [a-z] ]] && ((score++))
        [[ "$password" =~ [0-9] ]] && ((score++))
        [[ "$password" =~ [\!\@\#\$\%\^\&\*] ]] && ((score++))

        case $score in
            5) strength="Very Strong" ;;
            4) strength="Strong" ;;
            3) strength="Medium" ;;
            2) strength="Weak" ;;
            *) strength="Very Weak" ;;
        esac

        echo "$password → $strength" >> "$ANALYSIS_FILE"
    done < "$INPUT_DIR/passwords.txt"

    echo "[✓] Password strength analysis done"
}

# =====================================================
# MODULE 4: Brute-force Time Estimation
# =====================================================
estimate_bruteforce_time() {

    echo "" >> "$ANALYSIS_FILE"
    echo "BRUTE-FORCE TIME ESTIMATION" >> "$ANALYSIS_FILE"
    echo "---------------------------" >> "$ANALYSIS_FILE"

    CHARACTER_SET=62          # a-z A-Z 0-9
    ATTEMPTS_PER_SECOND=1000000

    for LENGTH in 6 8 10
    do
        COMBINATIONS=$(echo "$CHARACTER_SET^$LENGTH" | bc)
        TIME_SECONDS=$(echo "$COMBINATIONS / $ATTEMPTS_PER_SECOND" | bc)

        echo "Password Length $LENGTH → Approx. $TIME_SECONDS seconds" \
            >> "$ANALYSIS_FILE"
    done

    echo "[✓] Brute-force estimation completed"
}

# =====================================================
# MODULE 5: Report Generation
# =====================================================
generate_report() {

    echo "[+] Generating final audit report..."

    echo "PASSWORD SECURITY AUDIT REPORT" > "$REPORT_FILE"
    echo "====================================" >> "$REPORT_FILE"
    echo "Date: $(date)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    cat "$ANALYSIS_FILE" >> "$REPORT_FILE"

    echo "" >> "$REPORT_FILE"
    echo "SECURITY RECOMMENDATIONS" >> "$REPORT_FILE"
    echo "------------------------" >> "$REPORT_FILE"
    echo "- Enforce passwords ≥ 12 characters" >> "$REPORT_FILE"
    echo "- Require uppercase, lowercase, numbers & symbols" >> "$REPORT_FILE"
    echo "- Implement account lockout & rate limiting" >> "$REPORT_FILE"
    echo "- Use bcrypt / Argon2 for password hashing" >> "$REPORT_FILE"

    echo "[✓] Audit report saved to: $REPORT_FILE"
}

# =====================================================
# MAIN EXECUTION FLOW
# =====================================================
generate_dictionary
identify_hashes
analyze_password_strength
estimate_bruteforce_time
generate_report

echo "============================================"
echo " Password Audit Completed Successfully"F
echo "============================================"


