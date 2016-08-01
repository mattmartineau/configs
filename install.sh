
# Install vim locally
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --enable-python3interp \
  --with-python3-config-dir=/usr/lib/python3.5/config \
  --enable-gui=gtk2 --enable-cscope --prefix=/compteam/mattmar/vim/
make 
make install
cd ..
rm -rf vim

