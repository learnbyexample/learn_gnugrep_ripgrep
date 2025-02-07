## Shell quoting

echo 'a cat and a dog' | grep and a

echo 'a cat and a dog' | grep 'and a'

printf 'apple\na#2\nb#3\n' | grep #2

printf 'apple\na#2\nb#3\n' | grep '#2'

echo 'files *.txt' | grep -F *.txt

echo 'files *.txt' | grep -F '*.txt'

f='apple'

printf '!fruit=apple\n!fruit=pear' | grep "!fruit=$f"

printf '!fruit=apple\n!fruit=pear' | grep '!fruit='"$f"

## Patterns starting with hyphen

printf '-2+3=1\n'

echo '5*3-2=13' | grep '-2'

echo '5*3-2=13' | grep '\-2'

echo '5*3-2=13' | grep -- '-2'

printf -- '-2+3=1\n'

printf 'boat\nsite\nfoot' | grep -o '[aeo]+t'

printf 'boat\nsite\nfoot' | grep -o '[aeo]+t' -E

## Word boundary differences

echo '*$' | grep '\b\$\b'

echo '*$' | grep -w '\$'

echo 'I have 12, he has 2!' | grep -o '\b..\b'

echo 'I have 12, he has 2!' | grep -o '\<..\>'

echo 'I have 12, he has 2!' | grep -ow '..'

## Faster execution for ASCII input

time grep -xE '([a-d][r-z]){3}' words.txt > f1

time LC_ALL=C grep -xE '([a-d][r-z]){3}' words.txt > f2

diff -s f1 f2

time grep -xE '([a-z]..)\1' words.txt > f1

time LC_ALL=C grep -xE '([a-z]..)\1' words.txt > f2

rm f[12]

## Speed benefits with PCRE

time LC_ALL=C grep -xE '([a-z]..)\1' words.txt > f1

time grep -xP '([a-z]..)\1' words.txt > f2

rm f[12]

## Parallel execution

wget https://github.com/torvalds/linux/archive/v4.19.tar.gz

tar -zxf v4.19.tar.gz

du -sh linux-4.19

cd linux-4.19

time grep -rl 'include' . > ../f1

time find -type f -print0 | xargs -r0 grep -l 'include' > ../f2

time find -type f -print0 | xargs -r0 -P0 grep -l --line-buffered 'include' > ../f3

diff -sq <(sort ../f1) <(sort ../f2)

diff -sq <(sort ../f1) <(sort ../f3)

rm ../f[1-3]

