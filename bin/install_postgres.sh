paru -S postgresql --noconfirm --needed
sudo -u postgres initdb -D /var/lib/postgres/data
systemctl start postgresql.service
