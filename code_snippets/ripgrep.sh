## Installation

link='https://github.com/BurntSushi/ripgrep/releases/'

link="$link"'download/13.0.0/ripgrep_13.0.0_amd64.deb'

wget "$link"

sudo gdebi ripgrep_13.0.0_amd64.deb

rg --version

## Line number

rg 'day' ip.txt

printf 'apple\nbanana\ncherry' | rg 'an'

rg -N 'day' ip.txt

printf 'apple\nbanana\ncherry' | rg -n 'an'

rg 'to' ip.txt > out.txt

cat out.txt

rm out.txt

rg 'to' ip.txt | rg 'many'

rg -n 'to' ip.txt | rg 'many'

## Count

rg -c 'to' ip.txt search.txt

rg -c --include-zero 'to' ip.txt search.txt

rg -co 'an' ip.txt

rg --count-matches 'an' ip.txt

## Get filename instead of matching lines

rg --files-without-match 'to' ip.txt search.txt

## Filename prefix for matching lines

rg -N 'say' ip.txt search.txt

rg -NI 'say' ip.txt search.txt

rg -N 'play' ip.txt

rg -NH 'play' ip.txt

rg -N --no-heading 'say' ip.txt search.txt

rg 'say' ip.txt search.txt | cat -

rg -NI --no-heading 'say' ip.txt search.txt

## Field separator

rg --field-match-separator ')' 'the' ip.txt

rg --no-heading --field-match-separator ';' 'par' ip.txt pets.txt

## Colored output

rg --colors 'match:style:underline' 'to' ip.txt

rg --color=always 'the' ip.txt | rg --colors 'match:fg:blue' 'ark'

## Context matching

seq 29 | rg --context-separator '=====' -A1 '3'

seq 29 | rg --no-context-separator -A1 '3'

rg --no-heading -H -A1 'play' ip.txt

rg --no-heading -H --field-context-separator ')' -A1 'play' ip.txt

## Scripting options

rg 'in' xyz.txt

rg --no-messages 'in' xyz.txt

echo $?

rg --no-messages 'a(' ip.txt

rg --no-messages 'a(' ip.txt 2> /dev/null

echo $?

## Substitution

rg 'day' -r 'morning' ip.txt

rg --passthru -N 'and' -r '&' ip.txt

## Multiline matching

rg -U 'y\ng' ip.txt

## NUL separator

printf 'cred\nteal\0a2\0spared' | rg --null-data 'red' | sed 's/\x0/\n---\n/g'

## String vs line anchors

printf 'hi-hello\ntop-spot\n' | rg -o '^\w+'

printf 'hi-hello\ntop-spot\n' | rg -Uo '\A\w+'

printf 'hi-hello\ntop-spot\n' | rg -o '\w+$'

printf 'hi-hello\ntop-spot\n' | rg -Uo '\w+\n\z'

## Alternation precedence

echo 'best years' | rg 'year|years' -r 'X'

echo 'best years' | rg 'years|year' -r 'X'

printf 'spared PARTY PaReNt' | rg -io 'par|pare|spare'

printf 'spared PARTY PaReNt' | rg -io 'spare|pare|par'

## The dot metacharacter

printf 'blue green\nteal brown' | rg -Uo 'g.*n'

printf 'blue green\nteal brown' | rg -Uo '(?s)g.*n'

## Greedy Quantifiers

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{1, 4}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{,4}c'

echo 'fig123312apple' | rg -o 'g[123]+(12apple)?'

## Non-greedy quantifiers

echo 'foot' | rg 'f.??o' -r 'X'

echo 'frost' | rg 'f.??o' -r 'X'

## Character classes

echo 'Sample123string42with777numbers' | rg '\d+' -r ':'

echo 'Sample123string42with777numbers' | rg '\D+' -r ':'

echo 'tea sea-(pit sit);lean bean' | rg -o '[\w\s]+'

echo "Hi. How *are* you?" | rg '[[:^punct:]*]+' -r ''

## Set operations

echo 'tryst glyph pity why' | rg -ow '[a-z&&[^aeiou]]+'

echo 'gets eat top sigh' | rg -ow '[[a-l]~~[g-z]]+'

para='"Hi", there! How *are* you? All fine here.'

echo "$para" | rg '[[:punct:]--[.!?]]+' -r ''

## Backreferences

echo '[52] apples [and] [31] mangoes' | rg '\[(\d+)]' -r '$1'

echo '52 apples and 31 mangoes' | rg '\d+' -r '(${0}4)'

echo 'a b a' | rg 'a' -r '$$x'

echo 'a b a' | rg 'a' -r '$${a}'

echo '100' | rg '^' -r '$'

echo 'fort effort' | rg -ow '\w*(\w)\1\w*'

## Non-capturing groups

echo '1,2,3,4,5,6,7' | rg '^(([^,]+,){3})([^,]+)' -r '$1($3)'

echo '1,2,3,4,5,6,7' | rg '^((?:[^,]+,){3})([^,]+)' -r '$1($2)'

## Named capture groups

echo 'good,bad 42,24' | rg '(?P<fw>\w+),(?P<sw>\w+)' -r '$sw,$fw'

row='today,2008-24-03,food,2012-12-08,nice,5632'

echo "$row" | rg '(?P<dd>-\d{2})(?P<mm>-\d{2})' -r '$mm$dd'

## Extract matches with surrounding conditions

echo 'apple=42, fig=314, banana:512' | rg -o '=(\d+)' -r '$1'

echo '42 apple-5, fig3; x-83, y-20: f12' | rg -o '\-(\d+)[:;]' -r '$1'

s='cat scatter cater scat concatenate catastrophic catapult duplicate'

echo "$s" | rg -o '^(?:.*?cat.*?){2}(cat[a-z]*)' -r '$1'

echo "$s" | rg -o '(?:.*?cat.*?){2}(cat[a-z]*)' -r '$1'

## Modifiers

echo 'Cat cOnCaT scatter cut' | rg '(?i)cat' -r '[$0]'

printf 'Cat\ncOnCaT\nscatter\ncut' | rg -i '(?-i)cat'

echo 'Cat SCatTeR CATER cAts' | rg 'Cat(?i:[a-z]*)\b' -r '[$0]'

printf 'Cat\ncOnCaT\nscatter\nCater' | rg -Uo '(?is)on.*^cat'

echo 'fox,cat,dog,parrot' | rg -o '(?x) ( ,[^,]+ ){2}$ #last 2 columns'

echo 'a cat and a dog' | rg '(?x)t a'

echo 'a cat and a dog' | rg '(?x)t\ a'

echo 'foo a#b 123' | rg -o '(?x)a#.'

echo 'foo a#b 123' | rg -o '(?x)a\#.'

## Unicode

echo 'fox:αλεπού,eagle:αετός' | rg '\p{L}+' -r '($0)'

echo 'fox:αλεπού,eagle:αετός' | rg -o '\p{Greek}+'

echo 'φοο12,βτ_4,bat' | rg '\w+' -r '[$0]'

echo 'φοο12,βτ_4,bat' | rg '(?-u)\w+' -r '[$0]'

echo 'φοο12,βτ_4,bat' | rg -o '\P{L}+'

echo 'a cat and a dog' | rg 't\x20a'

echo 'fox:αλεπού,eagle:αετός' | rg -o '[\x61-\x7a]+'

echo 'fox:αλεπού,eagle:αετός' | rg -o '[\x{3b1}-\x{3bb}]+'

## Perl Compatible Regular Expressions

echo '1a42z' | grep -oP '[a-z]*'

echo '1a42z' | rg -oP '[a-z]*'

printf 'sub\nbit' | grep -P -f- five_words.txt

printf 'sub\nbit' | rg -P -f- five_words.txt

grep -P -e 'sub' -e 'bit' five_words.txt

rg -P -e 'sub' -e 'bit' five_words.txt

rg -NP '(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u' five_words.txt

s='cat scatter cater scat concatenate catastrophic catapult duplicate'

echo "$s" | rg -oP '^(.*?cat.*?){2}\Kcat[a-z]*'

echo 'fox,cat,dog,parrot' | rg -qP 'at((?!go).)*par' && echo 'match found'

echo 'aa a a a 42 f_1 f_1 f_13.14' | rg -P '\b(\w+)( \1)+\b' -r '$1'

expr='(a^b)'

echo 'f*(2-a/b) - 3*(a^b)-42' | rg -oP '\S*\Q'"$expr"'\E\S*'

echo '123-87-593 42 apple-12-345' | rg -o '\G\d+-?'

echo '123-87-593 42 apple-12-345' | rg -o --engine=auto '\G\d+-?'

## Sample directory

source grep.sh

tree -a

## Default behavior

rg 'blue'

rg --files

rg --files projects colors_1

## Ignore files

mkdir .git

echo 'color*' > .gitignore

rg --files

rg --no-ignore --files

rm -r .git .gitignore

## Hidden files

rg -l 'blue'

rg --hidden -l 'blue'

## Follow links

rg --hidden -l 'pwd'

stat -c '%N' projects/dot_files

rg --hidden -lL 'pwd'

## NUL separator for filenames

rg -l 'blue' | xargs rg -l 'teal'

rg -l0 'blue' | xargs -r0 rg -l 'teal'

## Predefined file types

rg --type-list | rg 'markdown'

rg --type-list | rg '^c:'

rg -t 'py' -t 'sh' --files

rg -t 'txt' --files

rg -T 'txt' --files

## Glob pattern matching

rg -g '*.{sh,py}' --files

rg -g '*color*' --files

rg -g '!*color*' --files

rg -g '*color*' -g '!*1*' --files

rg -T 'txt' -g '!*.sh' --files

rg -g '**/*[by]*/**' --files

rg -g '*/*[by]*/**' --files

rg -g '**/*[by]*/*' --files

## Limit traversal levels

rg --max-depth 1 --files

## Speed comparison

time grep -rw 'user' > ../f1

time rg -uuu -w 'user' > ../f2

diff -sq <(sort ../f1) <(sort ../f2)

rm ../f[12]

