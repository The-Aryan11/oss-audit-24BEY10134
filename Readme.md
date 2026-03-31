# OSS Audit — Git
### The Open Source Audit | Capstone Project | Open Source Software (NGMC)

---

## Student Details

| Field | Details |
|---|---|
| **Name** | Aryan Ranjan |
| **Registration Number** | 24BEY10134 |
| **Course** | Open Source Software |
| **Chosen Software** | **Git** |
| **Repository Name** | `oss-audit-24BEY10134` |

---

## About the Chosen Software — Git

**Git** is a free and open-source distributed version control system, originally created by **Linus Torvalds** in 2005. It was built after BitKeeper — the proprietary tool the Linux kernel team had been using — revoked free access to the open-source community. Rather than accept dependence on a proprietary tool, Torvalds wrote Git in a matter of weeks to meet the specific demands of a large, distributed, high-speed development project like the Linux kernel.

Today, Git is the most widely used version control system in the world, forming the backbone of platforms like GitHub, GitLab, and Bitbucket. It is licensed under the **GNU General Public License version 2 (GPL v2)**.

---

## Repository Structure

```
oss-audit-24BEY10134/
│
├── README.md                   ← You are here
├── report/
│   └── OSS_Audit_Report.pdf    ← Full project report (12–16 pages)
└── scripts/
    ├── script1_system_identity.sh
    ├── script2_package_inspector.sh
    ├── script3_disk_auditor.sh
    ├── script4_log_analyzer.sh
    └── script5_manifesto_generator.sh
```

---

## Scripts Overview

### Script 1 — System Identity Report (`script1_system_identity.sh`)

**Purpose:**
Displays a welcome-style system identity report for the Linux environment. It shows the distribution name, kernel version, currently logged-in user and their home directory, system uptime, current date and time, and a note about the open-source license covering the OS.

**Shell Concepts Used:**
- Variables and assignment
- Command substitution using `$()`
- `echo` with formatted output
- Built-in commands: `uname`, `whoami`, `uptime`, `date`, `lsb_release`

---

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)

**Purpose:**
Checks whether Git (the chosen software) is installed on the system. If installed, it retrieves and displays the version, license, and a brief summary. A `case` statement then prints a short philosophical note about the package based on its name.

**Shell Concepts Used:**
- `if-then-else` conditional logic
- `case` statement
- `rpm -qi` or `dpkg -l` for package inspection
- Pipe (`|`) with `grep` for filtering output
- Redirect of stderr using `&>/dev/null`

---

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)

**Purpose:**
Loops through a predefined list of important Linux system directories and reports the permissions, owner, group, and disk usage of each. Additionally checks whether Git's configuration directory (`~/.config/git` or `/etc/gitconfig`) exists and prints its permissions.

**Shell Concepts Used:**
- `for` loop iterating over an array
- `ls -ld` for permissions
- `du -sh` for disk usage
- `awk` and `cut` for field extraction
- `[ -d ]` directory existence check

---

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)

**Purpose:**
Accepts a log file path and an optional keyword as command-line arguments. Reads the file line by line, counts occurrences of the keyword (default: `error`), and prints a summary. Also prints the last five lines that matched the keyword. Handles the case where the file does not exist or is empty.

**Shell Concepts Used:**
- `while IFS= read -r` loop for line-by-line reading
- `if-then` inside a loop
- Counter variables with arithmetic `$(( ))`
- Command-line arguments (`$1`, `$2`)
- `grep` with `-i` flag for case-insensitive matching
- `tail` for displaying last matching lines

---

### Script 5 — The Open Source Manifesto Generator (`script5_manifesto_generator.sh`)

**Purpose:**
Interactively asks the user three questions about their open-source philosophy. Uses the answers to compose a personalised manifesto paragraph, which is then saved to a `.txt` file named after the current user. The saved file is displayed at the end.

**Shell Concepts Used:**
- `read -p` for interactive user input
- String concatenation and multi-line `echo`
- Writing to a file using `>` and `>>`
- `date` command for timestamping
- `cat` to display the output file
- Inline comments demonstrating the concept of aliases

---

## Dependencies

| Dependency | Purpose | Install Command |
|---|---|---|
| `bash` (v4.0+) | Required to run all scripts | Pre-installed on most Linux distros |
| `git` | Required for Script 2 (package inspection) | `sudo apt install git` / `sudo dnf install git` |
| `coreutils` | Provides `uname`, `uptime`, `date`, `du`, `ls` | Pre-installed |
| `lsb-release` | Used in Script 1 to detect distro name | `sudo apt install lsb-release` |
| `grep`, `awk`, `cut` | Text processing in Scripts 2, 3, 4 | Pre-installed |
| `rpm` or `dpkg` | Package info in Script 2 | Pre-installed (distro-dependent) |

> **Note:** Scripts are designed for Debian/Ubuntu-based (`apt`) and RPM-based (`dnf`/`rpm`) systems. Minor adjustments may be needed depending on your distribution.

---

## How to Run the Scripts

### Step 0 — Clone the Repository

```bash
git clone https://github.com/<your-username>/oss-audit-24BEY10134.git
cd oss-audit-24BEY10134/scripts
```

### Step 1 — Make All Scripts Executable

```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 2 — Run Each Script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```
No arguments required. Outputs system info directly to the terminal.

---

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```
No arguments required. Checks if `git` is installed and prints package details and a philosophy note.

---

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_auditor.sh
```
No arguments required. Audits `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, and Git's config path.

> Some directories (e.g. `/var/log`) may require `sudo` for accurate size reporting:
> ```bash
> sudo ./script3_disk_auditor.sh
> ```

---

**Script 4 — Log File Analyzer**
```bash
./script4_log_analyzer.sh /var/log/syslog error
```
- **Argument 1:** Path to any readable log file (e.g. `/var/log/syslog`, `/var/log/messages`)
- **Argument 2 (optional):** Keyword to search for. Defaults to `error` if not provided.

Example with a custom keyword:
```bash
./script4_log_analyzer.sh /var/log/syslog WARNING
```

---

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```
The script will prompt you with three questions. Answer them interactively. Your manifesto will be saved as `manifesto_<username>.txt` in the current directory and displayed on screen.

---

## Academic Integrity Note

All written sections of the accompanying report are composed in the student's own words and reflect original analysis and thinking. Scripts were written, tested, and understood by the student. AI tools were used only for concept clarification and debugging assistance — not for generating report content.

---

*By — **Aryan Ranjan** | Reg. No. — **24BEY10134***
