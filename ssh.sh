#!/bin/bash

# ===============================
# Secure SSH Setup + Custom MOTD
# ===============================

clear

echo "Applying SSH settings..."

# Update SSH config
sudo bash -c 'cat <<EOF > /etc/ssh/sshd_config
# SSH LOGIN SETTINGS
PasswordAuthentication yes
PermitRootLogin yes
PubkeyAuthentication no
ChallengeResponseAuthentication no
UsePAM yes

# SFTP SETTINGS
Subsystem sftp /usr/lib/openssh/sftp-server
EOF'

echo "Restarting SSH service..."
sudo systemctl restart ssh 2>/dev/null || sudo service ssh restart

# Create a cool ASCII MOTD
sudo bash <(curl -fsSL https://raw.githubusercontent.com/hopingboyz/vps-motd/main/motd.sh)
clear
echo ""
echo "🎉 SSH Configuration Completed Successfully!"
echo "📌 UnixNodes Vps has been Setuped."
echo "🔑 You can now set root password 👇"
echo ""

sudo passwd root

echo ""
echo "✨ All done! Enjoy your server! 🚀"
echo ""
