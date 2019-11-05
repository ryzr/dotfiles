DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

ln -sfv "$DOTFILES_DIR/git/config" ~/.gitconfig
ln -sfv "$DOTFILES_DIR/git/ignore" ~/.gitignore
ln -sfv "$DOTFILES_DIR/git/message" ~/.gitmessage
ln -sfv "$DOTFILES_DIR/gnupg/gpg" ~/.gnupg/gpg.conf
ln -sfv "$DOTFILES_DIR/gnupg/gpg-agent" ~/.gnupg/gpg-agent.conf
ln -sfv "$DOTFILES_DIR/gnupg/scdaemon" ~/.gnupg/scdaemon.conf
ln -sfv "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc
ln -sfv "$DOTFILES_DIR/mysql/my.cnf" ~/.my.cnf
ln -sfv "$DOFTFILES_DIR/vim/vimrc" ~/.vimrc
rm -r "$HOME/Library/Application Support/Sublime Text 3/Packages"
ln -sfv "$DOTFILES_DIR/sublime" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
