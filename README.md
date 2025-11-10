# Any.run Sandbox Detection

A batch script that demonstrates how to detect Any.run sandbox environment by exploiting its self-protection mechanisms.

## How It Works

This script detects Any.run by attempting to create and write to a directory that Any.run protects:

## The Detection Principle

On normal Windows systems:
- Admin users can freely create/write to `C:\Program Files\KernelLogger\`

On Any.run:
- The directory is protected (even from admin users)
- Any.run hides and secures its own files in this location
