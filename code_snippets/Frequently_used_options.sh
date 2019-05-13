printf '42\n' | file -

printf '42\r\n' | file -

cat programming_quotes.txt

grep 'twice' programming_quotes.txt

grep 'e th' programming_quotes.txt

printf 'avocado\nmango\nguava' | grep 'v'

echo 'int a[5]' | grep 'a[5]'

echo 'int a[5]' | grep 'a['

echo 'int a[5]' | grep 'a[5'

echo 'int a[5]' | grep -F 'a[5]'

echo 'int a[5]' | fgrep 'a[5]'

grep -i 'jam' programming_quotes.txt

printf 'Cat\ncOnCaT\nscatter\ncut' | grep -i 'cat'

seq 5 | grep -v '3'

printf 'goal\nrate\neat\npit' | grep -v 'at'

grep -n 'not' programming_quotes.txt

printf 'great\nnumber\numpteen' | grep -n 'r'

grep -c 'in' programming_quotes.txt

printf 'goal\nrate\neat\npit' | grep -vc 'g'

seq 15 | grep -c '1' programming_quotes.txt -

cat <(seq 15) programming_quotes.txt | grep -c '1'

grep -m3 'in' programming_quotes.txt

seq 1000 | grep -m4 '2'

grep -e '1' -e 'two' programming_quotes.txt

printf 'two\n1\n' > search_strings.txt

cat search_strings.txt

grep -f search_strings.txt programming_quotes.txt

grep -f search_strings.txt -e 'twice' programming_quotes.txt

grep 'in' programming_quotes.txt | grep 'not'

grep -l 'are' programming_quotes.txt search_strings.txt

grep -l 'xyz' programming_quotes.txt search_strings.txt

grep -l '1' programming_quotes.txt search_strings.txt

grep -L 'xyz' programming_quotes.txt search_strings.txt

grep -L 'are' programming_quotes.txt search_strings.txt

grep '1' programming_quotes.txt

seq 1000 | grep -h -m3 '1' - programming_quotes.txt

seq 1000 | grep -m3 '1' - programming_quotes.txt

grep -H '1' programming_quotes.txt

grep -Hn '1' *

vim -q <(grep -Hn '1' *)

grep --color=auto -m3 'in' programming_quotes.txt

grep --color=auto -n -e '1' -e 'worth' *.txt

grep --color=always 'in' programming_quotes.txt | grep --color 'not'

grep --color=auto 'in' programming_quotes.txt | grep --color 'not'

alias grep='grep --color=auto'

grep --color=always 'not' programming_quotes.txt | less -R

printf 'par value\nheir apparent\n' | grep 'par'

printf 'par value\nheir apparent\n' | grep -w 'par'

printf 'see my book list\nmy book\n' | grep 'my book'

printf 'see my book list\nmy book\n' | grep -x 'my book'

grep '1' *.txt

grep -x '1' *.txt

grep -cx '' programming_quotes.txt

printf 'teal\nlight blue\nbrown\nyellow\n' > colors_1

printf 'blue\nblack\ndark green\nyellow\n' > colors_2

grep -Fxf colors_1 colors_2

grep -Fvxf colors_1 colors_2

grep -Fvxf colors_2 colors_1

grep -o -e 'twice' -e 'hard' programming_quotes.txt

grep -c 'in' programming_quotes.txt

grep -o 'in' programming_quotes.txt | wc -l

