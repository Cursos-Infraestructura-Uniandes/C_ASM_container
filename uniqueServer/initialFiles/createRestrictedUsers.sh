#!/bin/bash

CSV_FILE="/tmp/users.csv"
USE_RBASH=0  # 1 to use restricted bash

# Commands to copy into each user's ~/bin
COMMANDS=(/usr/bin/clang /bin/ls) 

tail -n +2 "$CSV_FILE" | while IFS=',' read -r username password; do
    echo "Processing user: $username"

    # Skip if user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists, skipping..."
        continue
    fi

    # Create user and home
    useradd -m -s /bin/bash "$username"
    echo "$username:$password" | chpasswd

    # Use rbash if enabled
    if [[ "$USE_RBASH" -eq 1 ]]; then
        chsh -s /bin/rbash "$username"
    fi

    # Create work directory and bin
    mkdir -p "/home/$username/work"
    chown -R "$username:$username" "/home/$username/work" "/home/$username/bin"
    
    # Copy the initial files for the students
    cp /tmp/main.c "/home/$username/work/"
    cp /tmp/README.md "/home/$username/work/"

    if [[ "$USE_RBASH" -eq 1 ]]; then
        mkdir -p "/home/$username/bin"
        # Copy allowed commands
        for cmd in "${COMMANDS[@]}"; do
            cp "$cmd" "/home/$username/bin/"
        done
    fi
    # Setup .bash_profile
    
    PROFILE="/home/$username/.bash_profile"
    {
        echo 'cd ~/work'
    } > "$PROFILE"

    chown root:root "$PROFILE"
    chmod 644 "$PROFILE"

    echo "User $username set up successfully."
done

