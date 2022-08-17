#!/bin/bash
while IFS=, read -r USERNAME PUBLIC_KEY
do
    useradd $USERNAME
    mkdir /home/$USERNAME/.ssh
    touch /home/$USERNAME/.ssh/authorized_keys
    chmod 700 /home/$USERNAME/.ssh
    chmod 600 /home/$USERNAME/.ssh/authorized_keys
    chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
    echo $PUBLIC_KEY >> /home/$USERNAME/.ssh/authorized_keys
    usermod -aG wheel $USERNAME
    echo "Added user $USERNAME"
done < new_users.csv

