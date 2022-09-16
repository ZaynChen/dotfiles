paru -S metasploit --noconfirm --needed
./install_postgres.sh
msfdb init --connection-string=postgresql://postgres@localhost:5432/postgres
