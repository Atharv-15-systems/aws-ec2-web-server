#!/bin/bash
# Installs Apache on Ubuntu 24.04 and deploys the sample app.
# Run on the EC2 instance:  bash setup-apache.sh
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo systemctl enable --now apache2
sudo cp ../app/index.html /var/www/html/index.html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
sudo apache2ctl configtest
sudo systemctl reload apache2
echo "Done. Open http://<PUBLIC_IP> in a browser."
