## Sample directory

source grep.sh

tree -a

## Recursive options

grep -r 'clear'

grep -rh 'clear'

grep -rl 'blue'

grep -rL 'blue'

grep -rl 'pwd'

grep -rl 'pwd' backups projects/dot_files

grep -Rl 'pwd'

## Customize search path

grep -rl 'blue'

grep -rl --include='*.txt' 'blue'

printf '*.txt\n.hi*' | grep -rl --exclude-from=- 'blue'

grep -rl --exclude-dir='backups' --exclude='.*' 'blue'

grep -rl --include='*.txt' --include='.hi*' 'blue'

grep -rl --exclude='*.sh' --include='*ll*' 'He'

grep -rl --include='*ll*' --exclude='*.sh' 'He'

grep -l --exclude='*.sh' 'He' projects/*/*

grep -l --include='*.sh' 'He' projects/*/*

## extglob and globstar

shopt -s extglob globstar

grep -l 'r' **/*.@(txt|py|sh)

printf '%s\n' **/*py*

grep -l 'on' **/*py*

grep -d skip -l 'on' **/*py*

## find command

find -L -type f -size -25c

find -L -type f -size -25c -exec grep 'e$' {} +

## Piping filenames

grep -rl 'clear'

grep -rl 'clear' | xargs head -n1

grep -rl 'blue'

grep -rl 'blue' | xargs grep -l 'teal'

grep -rlZ 'blue' | xargs -0 grep -l 'teal'

grep -rlZ 'violet' | xargs -0 grep -L 'brown'

grep -rlZ 'violet' | xargs -r0 grep -L 'brown'

