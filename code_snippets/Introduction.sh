wget https://ftp.gnu.org/gnu/grep/grep-3.3.tar.xz

tar -Jxf grep-3.3.tar.xz

cd grep-3.3/

./configure 

make

sudo make install

type -a grep

grep -V | head -n1

man grep

