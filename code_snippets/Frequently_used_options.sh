## Basic string search

cat ip.txt

grep 'play' ip.txt

grep 'y t' ip.txt

printf 'apple\nbanana\nmango\nfig\n' | grep 'an'

printf 'apple\nbanana\nmango\nfig\n' | grep 'an' -

grep 'is' > op.txt

cat op.txt

rm op.txt

printf '42\n' | file -

printf '42\r\n' | file -

## Fixed string search

echo 'int a[5]' | grep 'a[5]'

echo 'int a[5]' | grep 'a['

echo 'int a[5]' | grep 'a[5'

echo 'int a[5]' | grep -F 'a[5]'

## Case insensitive search

grep -i 'the' ip.txt

printf 'Cat\ncOnCaT\ncut\n' | grep -i 'cat'

## Invert matching lines

seq 4 | grep -v '3'

printf 'goal\nrate\neat\npit' | grep -v 'at'

## Line number and count

grep -n 'to' ip.txt

printf 'great\nneat\nuser' | grep -n 'eat'

grep -c 'is' ip.txt

printf 'goal\nrate\neat\npit' | grep -vc 'g'

printf 'this\nis\ncool\n' | grep -c 'is' ip.txt -

cat <(printf 'this\nis\ncool\n') ip.txt | grep -c 'is'

## Limiting output lines

grep -m2 'is' ip.txt

seq 1000 | grep -m4 '2'

## Multiple search strings

grep -e 'what' -e 'But' ip.txt

cat search.txt

grep -Ff search.txt ip.txt

grep -Ff search.txt -e 'it' -e 'are' ip.txt

grep 'is' ip.txt | grep 'to'

## Get filename instead of matching lines

grep -l 'are' ip.txt search.txt

grep -l 'xyz' ip.txt search.txt

grep -l 'say' ip.txt search.txt

grep -L 'xyz' ip.txt search.txt

grep -L 'are' ip.txt search.txt

## Filename prefix for matching lines

grep 'say' ip.txt

printf 'say\nyou\n' | grep -h 'say' - ip.txt

printf 'say\nyou\n' | grep 'say' - ip.txt

grep -H 'say' ip.txt

## Quickfix

grep -Hn 'say' ip.txt search.txt

vim -q <(grep -Hn 'say' ip.txt search.txt)

## Colored output

grep --color 'the' ip.txt

grep --color -e 'play' -e 'say' ip.txt search.txt

alias ls='ls --color=auto'

alias grep='grep --color=auto'

grep --color=always -i 'the' ip.txt | less -R

grep --color=always 'is' ip.txt | grep --color 'to'

grep --color=auto 'is' ip.txt | grep --color 'to'

## Match whole word

printf 'par value\nheir apparent\n' | grep 'par'

printf 'par value\nheir apparent\n' | grep -w 'par'

## Match whole line

printf 'see my book list\nmy book\n' | grep 'my book'

printf 'see my book list\nmy book\n' | grep -x 'my book'

grep 'say' ip.txt search.txt

grep -x 'say' ip.txt search.txt

grep -cx '' ip.txt

## Comparing lines between files

printf 'teal\nlight blue\nbrown\nyellow\n' > colors_1

printf 'blue\nblack\ndark green\nyellow\n' > colors_2

grep -Fxf colors_1 colors_2

grep -Fvxf colors_1 colors_2

grep -Fvxf colors_2 colors_1

## Extract only the matching portions

grep -oi 'the' ip.txt

grep -c 'an' ip.txt

grep -o 'an' ip.txt | wc -l

