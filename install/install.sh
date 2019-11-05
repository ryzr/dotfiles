DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Updating macOS defaults..."
  . "$DOTFILES_DIR/macos/defaults.sh"

  echo "Installing Brew + applications..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew update
  brew tap homebrew/bundle
  brew bundle --file="$DOTFILES_DIR/macos/Brewfile"

  echo "Adjusting macOS dock"
  . "$DOTFILES_DIR/macos/dock.sh"

  echo "Installing composer"
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
  /usr/local/bin/composer global require hirak/prestissimo laravel/installer laravel/valet friendsofphp/php-cs-fixer  

  ~/.composer/vendor/bin/valet install
else
  echo "Installing zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

chsh -s $(which zsh)

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "Linking config files..."
. "$DOTFILES_DIR/install/symlinks.sh"
