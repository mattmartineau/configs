#!/bin/bash

# Check if the parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <HOME_DIRECTORY>"
    exit 1
fi

# Set HOME to the provided parameter
export HOME="$1"
echo "HOME is set to $HOME"

# Change to HOME directory
cd "$HOME" || exit

# Pull the repo
git clone git@github.com:mattmartineau/configs.git

# Change to the configs directory
cd configs || exit

# Symlink all the dot files
for file in .??*; do
    if [ -f "$file" ]; then
        ln -sf "$PWD/$file" "$HOME/$file"
    fi
done

ln -sf "$PWD/.vim" "$HOME/.vim"
ln -sf "$PWD/tmux.sh" "$HOME/tmux.sh"

cd "$HOME" || exit

## Install vim locally
#git clone https://github.com/vim/vim.git vim_src
#cd vim_src
#./configure --with-features=huge \
#  --with-x \
#  --enable-gui=gtk3 \
#  --enable-cscope \
#  --prefix=${HOME}/vim/
#make 
#make install
#cd ${HOME}
#rm -rf vim_src

# Install vim-plug if not already installed
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Set up vim plugins using vim-plug
if [ -f "$HOME/.vimrc" ]; then
    vim +PlugInstall +qall
fi

echo "Setup completed successfully."

