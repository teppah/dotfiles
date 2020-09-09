echo "Configuring alacritty, vim, zsh"

link_zsh() {
  if [[ -d ~/.oh-my-zsh/ ]]; then
    if [[ -e ~/.zshrc ]]; then
      echo ".zshrc already exists, making backup to .zshrc.bak"
      mv ~/.zshrc ~/.zshrc.bak
    fi
    ln -s "$PWD/zsh/.zshrc" ~/.zshrc
    echo "linked zshrc"
  else
    echo "oh-my-zsh is not installed"
  fi
}

link_p10k() {
  if [[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    if [[ -e ~/.p10k.zsh ]]; then
      echo ".p10k.zsh already exists, making backup to .p10k.zsh.bak"
      mv ~/.p10k.zsh ~/.p10k.zsh.bak
    fi
    ln -s "$PWD/p10k/.p10k.zsh" ~/.p10k.zsh
    echo "linked .p10k.zsh"
  else
    echo "powerlevel10k is not installed"
  fi
}

link_alacritty() {
  if [[ -e ~/.config/alacritty/alacritty.yml ]]; then
    echo "~/.config/alacritty/alacritty.yml already exists, making backup to alacritty.yml.bak"
    mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
  fi
  ln -s "$PWD/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
  echo "linked alacritty.yml"
}

link_vim() {
  if [[ -e ~/.vimrc ]]; then
    echo "~/.vimrc already exists, making backup to .vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
  fi
  if [[ ! -d ~/.vim/ ]]; then
    echo "~/.vim/ does not exist, creating directory"
    mkdir ~/.vim/
  else
    if [[ -e ~/.vim/coc-settings.json ]]; then
      echo "~/.vim/coc-settings.json already exists, makig backup to coc-settings.json.bak"
      mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.bak
    fi
  fi
  ln -s "$PWD/vim/.vimrc" ~/.vimrc
  ln -s "$PWD/vim/coc-settings.json" ~/.vim/coc-settings.json
}

link_zsh
link_p10k
link_alacritty
link_vim
