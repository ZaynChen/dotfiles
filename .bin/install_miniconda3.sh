paru -S miniconda3 --noconfirm --needed

if [ -z "$(grep -i miniconda3 ~/.zshrc)" ] ; then
  echo "[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh" >> ~/.zshrc
fi

ln -s /opt/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
