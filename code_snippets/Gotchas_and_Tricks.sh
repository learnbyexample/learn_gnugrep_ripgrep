echo 'a cat and a dog' | grep and a

echo 'a cat and a dog' | grep 'and a'

printf 'foo\na#2\nb#3\n' | grep #2

printf 'foo\na#2\nb#3\n' | grep '#2'

ls *.txt

echo '*.txt' | grep -F *.txt

echo '*.txt' | grep -F '*.txt'

expr='(a^b)'

echo '\S*\Q'"$expr"'\E\S*'

echo 'f*(2-a/b) - 3*(a^b)-42' | grep -oP '\S*\Q'"$expr"'\E\S*'

printf '-2+3=1\n'

echo '5*3-2=13' | grep '-2'

echo '5*3-2=13' | grep '\-2'

echo '5*3-2=13' | grep -- '-2'

printf -- '-2+3=1\n'

printf 'boat\nsite\nfoot' | grep '[aeo]+t'

printf 'boat\nsite\nfoot' | grep '[aeo]+t' -E

echo '*$' | grep '\b\$\b'

echo '*$' | grep -w '\$'

echo 'I have 12, he has 2!' | grep -o '\b..\b'

echo 'I have 12, he has 2!' | grep -o '\<..\>'

echo 'I have 12, he has 2!' | grep -ow '..'

mkdir gotchas_tricks && cd $_

wget https://www.gutenberg.org/files/60/60.txt -O scarlet_pimpernel.txt

file scarlet_pimpernel.txt 

time grep -wE '([a-d][r-z]){3}' scarlet_pimpernel.txt > f1

time LC_ALL=C grep -wE '([a-d][r-z]){3}' scarlet_pimpernel.txt > f2

cd ../bre_ere/

time LC_ALL=C grep -xE '([a-z]..)\1' words.txt > f1

time LC_ALL=C grep -xP '([a-z]..)\1' words.txt > f2

rm f[12]

wget https://github.com/torvalds/linux/archive/v4.19.tar.gz

tar -zxf v4.19.tar.gz

du -sh linux-4.19

cd linux-4.19

time grep -rl 'include' . > ../f1

time find -type f -print0 | xargs -0 grep -l 'include' > ../f2

time find -type f -print0 | xargs -0 -P2 grep -l 'include' > ../f3

diff -sq <(sort ../f1) <(sort ../f2)

diff -sq <(sort ../f1) <(sort ../f3)

cd ..

/bin/grep --version | head -n1

time /bin/grep -wE '([a-d][r-z]){3}' scarlet_pimpernel.txt > f1

grep --version | head -n1

time grep -wE '([a-d][r-z]){3}' scarlet_pimpernel.txt > f2

rm f[1-3]

