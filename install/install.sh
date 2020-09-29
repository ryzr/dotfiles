#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Updating macOS defaults..."
  . "$DOTFILES_DIR/macos/defaults.sh"


  if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Brew + applications..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  brew tap homebrew/bundle
  brew bundle --file="$DOTFILES_DIR/macos/Brewfile"

  echo "Adjusting macOS dock"
  . "$DOTFILES_DIR/macos/dock.sh"

  if ! [ -x "$(command -v composer)" ]; then
    echo "Installing composer"
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    /usr/local/bin/composer global require hirak/prestissimo laravel/installer laravel/valet friendsofphp/php-cs-fixer  
  fi

  ~/.composer/vendor/bin/valet install


fi

echo "Installing zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

chsh -s $(which zsh)

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/bhilburn/powerlevel9k.git "$ZSH_CUSTOM/themes/powerlevel9k"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Linking config files..."
. "$DOTFILES_DIR/install/symlinks.sh"
