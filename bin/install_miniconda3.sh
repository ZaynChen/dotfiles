paru -S miniconda3 --noconfirm --needed

# if [ -z "$(grep -i miniconda3 ~/.conig/zsh/.zshrc)" ] ; then
#   echo "[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh" >> ~/.config/zsh/.zshrc
# fi

sudo ln -s /opt/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
