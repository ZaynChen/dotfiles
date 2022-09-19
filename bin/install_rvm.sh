# sudo for multi-user installation
echo "multi-user installation"

sudo gpg2 --keyserver hkp://keys.openpgp.org:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | sudo bash -s stable

echo "please add yourself and your users to the 'rvm' group"
echo "usermod -a -G rvm <user>"
