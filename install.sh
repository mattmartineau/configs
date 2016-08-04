
# Install vim locally
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --enable-python3interp \
  --with-python3-config-dir=/usr/lib/python3.5/config \
  --with-x \
  --enable-gui=gtk2 --enable-cscope --prefix=/compteam/mattmar/vim/
make 
make install
cd ..
rm -rf vim

## Install all vim plugins
#vim +PluginInstall +qall
#
## Setup C language completion
#cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/compteam/mattmar/trunk_release/obj/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#cmake --build . --target ycm_core --config Release
#
