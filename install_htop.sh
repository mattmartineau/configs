# Change these!!
CONFIG=~/.profile
TAR=http://hisham.hm/htop/releases/2.0.2/htop-2.0.2.tar.gz
INSTALL_ROOT=/lus/scratch/p02185/apps/
 
# Shouldn't need to change these
mkdir -p $INSTALL_ROOT/htop/build/
mkdir -p $INSTALL_ROOT/htop/src/

cd $INSTALL_ROOT/htop/

curl -L "$TAR" | tar -xzvf - -C src --strip-components=1

cd src

./configure --prefix=$INSTALL_ROOT/htop/build/
make
make install

echo "PATH=$INSTALL_ROOT/htop/build/bin/:$PATH" > $CONFIG

