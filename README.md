# SMTP User Enumeration Script

## Description

This Bash script is used to perform user enumeration on SMTP servers using the `VRFY` command. It checks if the SMTP server supports the `VRFY` command and, if so, attempts to verify the existence of users provided through a user list file.

**Written by**: tyto

## Usage

```bash
./script.sh <host> <port> <user_list> [-v]
```

- `<host>`: IP address or hostname of the target SMTP server.
- `<port>`: SMTP server port (usually `25`).
- `<user_list>`: Path to the file containing the list of usernames to test, one per line.
- `-v` (optional): Verbose mode, displays additional details during execution.

### Example Usage

```bash
./script.sh 192.168.0.2 25 wordlists/users.txt -v
```

This command attempts to enumerate users listed in the `wordlists/users.txt` file on the SMTP server located at `192.168.0.2` on port `25`, with verbose output enabled.

## Manual Testing

To perform this same test manually use:

```bash
for user in $(cat wordlist.txt); do echo -e "VRFY $user\nQUIT" | nc 192.168.12.5 -nv 25 2>&1 | grep ^"252"; done
```

## Dependencies

- The script uses the `nc` (Netcat) command. Make sure `nc` is installed on your system.

```bash
sudo apt-get install netcat
```

## Security Notes

- This script is intended for educational and ethical pentesting purposes. Make sure you have permission to perform this type of test on the target SMTP server.
- Unauthorized use of this script may violate security policies and local laws.

