# Any.run Sandbox Detection

A batch script that demonstrates how to detect Any.run sandbox environment by exploiting its self-protection mechanisms.

## How It Works

This script detects Any.run by attempting to write to a directory that Any.run specifically uses and protects:

2. **Directory Access Test** - Attempts to access `C:\Program Files\KernelLogger\`
3. **File Write Test**       - Tries to write a test file to this location
4. **Detection**             - Failure: Any.run environment

## The Detection Principle

**Key Insight**: `C:\Program Files\KernelLogger\` is **not a Windows system directory** - it's created and used exclusively by Any.run for its own components.

On normal Windows systems:
- `C:\Program Files\KernelLogger\` doesn't exist by default
- Admin users can freely create and write to this directory

On Any.run:
- The directory already exists and contains Any.run's files
- Any.run implements extra protection to prevent tampering with its components
- Even with admin rights, write attempts fail due to sandbox self-protection
- The directory is hidden/protected from modification

## Disclaimer
This is for educational and security research purposes only. Use this responsibly.
