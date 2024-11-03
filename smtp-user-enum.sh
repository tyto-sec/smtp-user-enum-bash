#!/bin/bash

echo -e "\nSMTP User Enumeration"
echo "Written by tyto"

if [ -z "$3" ]; then
    echo "Example: $0 192.168.0.2 25 wordlists/users.txt"
else 
    echo ""
    verbose=false
    
    if [ "$4" == "-v" ]; then
        verbose=true
    fi

    ehlo=$(echo -e "EHLO test \nQUIT" | nc -nv $1 $2 2>&1)

    if echo "$ehlo" | grep -q "VRFY"; then
        for user in $(cat $3); do
            if [ "$verbose" == true ]; then
                echo "Testing user: $user"
            fi
            
            response=$(echo -e "VRFY $user\nQUIT" | nc -nv $1 $2 2>&1)

            if echo "$response" | grep -q "^252"; then
                echo " - User found: $user"
            fi
        done
    else
        echo "VRFY command is not supported"
    fi
fi
echo ""