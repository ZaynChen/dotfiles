# sudo for multi-user installation
echo "multi-user installation"

sudo gpg2 --keyserver hkp://keys.openpgp.org:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | sudo bash -s stable

grep -q "ruby-url" /usr/local/rvm/user/db ||
  echo "ruby_url=https://cache.ruby-china.com/pub/ruby" >> /usr/local/rvm/user/db

rvm install ruby-3

echo "please add yourself and your users to the 'rvm' group"
echo "usermod -a -G rvm <user>"
