cat find.md

grep -wE '(\w+) \1' find.md

grep -qwE '(\w+) \1' find.md

echo $?

grep -q 'xyz' find.md

echo $?

grep -qwE '(\w+) \1' find.md && echo 'Repeated words found!'

grep 'in' xyz.txt

grep -s 'in' xyz.txt

echo $?

touch foo.txt

chmod -r foo.txt

grep 'rose' foo.txt

grep -s 'rose' foo.txt

echo $?

grep -sE 'a(' find.md

grep -sE 'a(' find.md 2> /dev/null

echo $?

grep -zowE '(\w+)\s+\1' find.md | od -c

grep -zowE '(\w+)\s+\1' find.md | sed 's/\x0/\n---\n/g'

printf 'dark red\nteal\0a2\0spared' | grep -z 'red' | sed 's/\x0/\n---\n/g'

printf 'dark red\nteal\0a2\0spared' | grep -z 'red' | od -c

grep -b 'is' find.md

grep -b 'it' find.md

grep -ob 'art\b' find.md

awk '/is/{print NR, index($0, "is")-1}' find.md

echo 'red and blue' | grep -c 'and' - find.md

echo 'red and blue' | grep --label='stdin' -c 'and' - find.md

