## Suppress stdout

cat find.md

grep -wE '(\w+) \1' find.md

grep -qwE '(\w+) \1' find.md

echo $?

grep -q 'xyz' find.md

echo $?

grep -qwE '(\w+) \1' find.md && echo 'Repeated words found!'

## Suppress stderr

grep 'in' xyz.txt

grep -s 'in' xyz.txt

echo $?

touch new.txt

chmod -r new.txt

grep 'rose' new.txt

grep -s 'rose' new.txt

echo $?

rm -f new.txt

grep -sE 'a(' find.md

grep -sE 'a(' find.md 2> /dev/null

echo $?

## Multiline matching

grep -zowE '(\w+)\s+\1' find.md | od -c

grep -zowE '(\w+)\s+\1' find.md | tr '\0' '\n'

grep -zowE '(\w+)\s+\1' find.md | sed 's/\x0/\n---\n/g'

printf 'dark red\nteal\0a2\0spared' | grep -z 'red' | sed 's/\x0/\n---\n/g'

## Byte offset

grep -b 'is' find.md

grep -b 'it' find.md

grep -ob 'art\b' find.md

awk 'match($0, /is/){print NR, RSTART, $0}' OFS=: find.md

rg --column 'is' find.md

## Naming stdin

echo 'red and blue' | grep -c 'and' - find.md

echo 'red and blue' | grep --label='stdin' -c 'and' - find.md

