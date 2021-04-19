mkdir recursive_matching && cd $_

printf 'hide\nobscure\nconceal\ncover\nblot\nshield' > patterns.txt

grep -Ff patterns.txt ../bre_ere/words.txt > .hidden

grep -E '([as]([b-g]|po)[r-t]){2}' ../bre_ere/words.txt > nested_group.txt

mkdir scripts

echo 'yrneaolrknzcyr 86960' > scripts/.key

echo "tr 'a-z0-9' 'n-za-m5-90-4' < .key" > scripts/decode.sh

printf "import math\n\nprint(math.pi)\n" > scripts/pi.py

ln -s ../context_matching/

tree -al

## -r and -R

grep -r '[0-9]'

grep -rh '[0-9]'

grep -rl 'in'

grep -rL 'in' scripts

grep -rlx ''

grep -rlx '' . context_matching

grep -Rlx ''

## Customize search path

grep -Rl 'in'

grep -Rl --exclude-dir='scripts' --exclude='.*' 'in'

grep -Rl --include='*.txt' 'in'

grep -Rl --include='*.txt' --include='*.py' 'in'

printf '*en\n*.txt' | grep -Rl --exclude-from=- 'in'

grep -Rl --include='*on*' --exclude='*.txt' 'in'

grep -Rl --exclude='*.txt' --include='*on*' 'in'

grep -l 'a' scripts/*

grep -l --exclude='*.sh' 'a' scripts/*

grep -l --include='*.sh' 'a' scripts/*

## Extended globs

shopt -s extglob globstar 

grep -l 'in' **/*.@(txt|py)

printf '%s\n' **/*context*

grep -l 'in' **/*context*

grep -d skip -l 'in' **/*context*

## Using find command

find -L -type f -size -50c

find -L -type f -size -50c -exec grep 'e$' {} +

## Piping filenames

grep -rlZ '[0-9]' | od -c

grep -rlZ '[0-9]' | xargs -0 awk '{print $NF}'

echo 'how are you?' > normal.txt

echo 'how dare you!' > 'filename with spaces.txt'

grep -r 'are'

grep -rl 'are' | xargs wc

grep -rlZ 'are' | xargs -0 wc

grep -rl 'in'

grep -rlZ 'in' | xargs -0 grep -l 'or'

grep -rlZ 'in' | xargs -0 grep -L 'at'

grep -rlZ 'in' | xargs -0 grep -lZ 'or' | xargs -0 grep -l 'at'

