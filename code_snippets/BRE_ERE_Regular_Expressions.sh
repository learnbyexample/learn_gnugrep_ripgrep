## Line Anchors

printf 'spared no one\npar\nspar\ndare' | grep '^pa'

printf 'spared no one\npar\nspar\ndare' | grep 'ar$'

printf 'spared no one\npar\nspar\ndare' | grep '^par$'

printf 'spared no one\npar\nspar\ndare' | grep -x 'par'

## Word Anchors

cat word_anchors.txt

grep '\bpar' word_anchors.txt

grep 'par\b' word_anchors.txt

grep '\bpar\b' word_anchors.txt

grep -w 'par' word_anchors.txt

grep '\Bpar\B' word_anchors.txt

grep '\Bpar' word_anchors.txt

grep 'par\B' word_anchors.txt

## Alternation

printf 'I like cats\nI like parrots\nI like dogs' | grep 'cat\|dog'

printf 'I like cats\nI like parrots\nI like dogs' | grep -E 'cat|dog'

printf 'I like cats\nI like parrots\nI like dogs' | grep -e 'cat' -e 'dog'

printf 'CATs dog bee parrot FoX' | grep -ioE 'cat|dog|fox'

grep -E '^a|e\b' word_anchors.txt

grep --color=auto -E '^|pare' word_anchors.txt

grep --color=auto -E 'sub|put|tar|$' word_anchors.txt

echo 'car spared spar' | grep -oE 'are|spared'

echo 'car spared spar' | grep -oE 'spared|are'

echo 'pool party 2' | grep -oE 'party|par'

echo 'pool party 2' | grep -oE 'par|party'

echo 'pool party 2' | grep -oP 'par|party'

## Grouping

printf 'red\nreform\nread\narrest' | grep -E 'reform|rest'

printf 'red\nreform\nread\narrest' | grep -E 're(form|st)'

printf 'sub par\nspare\npart time' | grep -E '\bpar\b|\bpart\b'

printf 'sub par\nspare\npart time' | grep -E '\b(par|part)\b'

printf 'sub par\nspare\npart time' | grep -E '\bpar(|t)\b'

## Escaping metacharacters

echo 'a^2 + b^2 - C*3' | grep 'b^2'

echo '$a = $b + $c' | grep '$b'

echo '$a = $b + $c' | grep -o '\$' | wc -l

echo '$a = $b + $c' | grep -oF '$' | wc -l

printf '(a/b) + c\n3 + (a/b) - c' | grep '^(a/b)'

printf '(a/b) + c\n3 + (a/b) - c' | grep -E '^\(a/b)'

## Matching characters like tabs

echo 'attempt' | grep -o 'a\tt'

printf 'go\tto\ngo to' | grep $'go\tto'

printf 'go\tto\ngo to' | grep $'go\x20to'

## The dot meta character

echo 'tac tin cot abc:tuv excite' | grep -o 'c.t'

printf '42\t33\n'

printf '42\t33\n' | grep -o '2.3'

grep -xE 'c..(t|l)y' words.txt

## Quantifiers

printf 'fed\nfod\nfe:d\nfeed' | grep -wE 'fe.?d'

printf 'sub par\nspare\npart time' | grep -wE 'part?'

echo 'par part parrot parent' | grep -oE 'par(ro)?t'

echo 'par part parrot parent' | grep -oE 'par(en|ro)?t'

echo 'fd fed fod fe:d feeeeder' | grep -o 'fe*d'

echo '3111111111125111142' | grep -o '1*2'

echo 'fd fed fod fe:d feeeeder' | grep -oE 'fe+d'

echo 'fd fed fod fe:d feeeeder' | grep -oE 'f(e|o|:)+d'

echo '3111111111125111142' | grep -oE '1+2'

echo '3111111111125111142' | grep -oE '1+4?2'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oE 'ab{1,4}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oE 'ab{3,}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oE 'ab{,2}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oE 'ab{3}c'

echo 'Error: not a valid input' | grep -o 'Error.*valid'

echo 'a cat and a dog' | grep -E 'cat.*dog|dog.*cat'

echo 'dog and cat' | grep -E 'cat.*dog|dog.*cat'

## Longest match wins

echo 'foot' | grep -oE 'f.?o'

echo 'car bat cod map scat dot abacus' | grep -o '.*'

echo 'foo123312baz' | grep -oE 'o(1|2|3)+(12baz)?'

echo 'foo123312baz' | grep -oP 'o(1|2|3)+(12baz)?'

echo 'car bat cod map scat dot abacus' | grep -o '.*m'

echo 'car bat cod map scat dot abacus' | grep -o 'c.*t'

echo 'car bat cod map scat dot abacus' | grep -o 'c.*at'

echo 'car bat cod map scat dot abacus' | grep -o 'b.*m*'

## Character classes

printf 'cute\ncat\ncot\ncoat\ncost\nscuttle' | grep 'c[ou]t'

printf 'meeting\ncute\nboat\nsite\nfoot' | grep -E '[aeo]+t'

echo 'do so in to no on' | grep -ow '[sot][on]'

grep -xE '[on]{2,}' words.txt

echo 'Sample123string42with777numbers' | grep -oE '[0-9]+'

echo 'coat Bin food tar12 best' | grep -owE '[a-z]+'

echo 'coat Bin food tar12 best' | grep -owE '[a-z0-9]+'

echo 'go no u grip read eat pit' | grep -owE '[p-z][a-z]*'

echo '23 154 12 26 34' | grep -ow '[12][0-9]'

echo '23 154 12 26 98234' | grep -owE '[0-9]{3,}'

echo '0501 035 154 12 26 98234' | grep -owE '0*[1-9][0-9]{2,}'

echo 'Sample123string42with777numbers' | grep -oE '[^0-9]+'

echo 'foo=42; baz=123' | grep -o '^[^=]*'

echo 'foo:123:bar:baz' | grep -oE '(:[^:]+){2}$'

echo 'I like "mango" and "guava"' | grep -oE '"[^"]+"'

printf 'tryst\nfun\nglyph\npity\nwhy' | grep -xE '[^aeiou]*'

printf 'tryst\nfun\nglyph\npity\nwhy' | grep -v '[aeiou]'

printf 'load;err_msg--\nant,r2..not\n' | grep -o '\w*'

printf '   1..3  \v\f  foo_baz 42\tzzz   \r\n1-2-3\n\n' | grep -o '\S*'

printf 'err_msg\nxerox\nant\nm_2\nP2\nload1\neel' | grep -x '[[:lower:]]*'

printf 'err_msg\nxerox\nant\nm_2\nP2\nload1\neel' | grep -x '[[:lower:]_]*'

printf 'err_msg\nxerox\nant\nm_2\nP2\nload1\neel' | grep -x '[[:alnum:]]*'

echo 'pie tie#ink-eat_42;' | grep -o '[^[:punct:]]*'

echo 'ab-cd gh-c 12-423' | grep -owE '[a-z-]{2,}'

printf 'int a[5]\nfoo\n1+1=2\n' | grep '[=]]'

printf 'int a[5]\nfoo\n1+1=2\n' | grep '[]=]'

echo 'int a[5]' | grep '[x[.y]'

echo 'int a[5]' | grep '[x[y.]'

echo 'f*(a^b) - 3*(a+b)/(a-b)' | grep -o 'a[+^]b'

echo '5ba\babc2' | grep -o '[a\b]*'

## Backreferences

grep -xE '([a-z]{3})..\1' words.txt

grep -xE '([a-d]..)\1' words.txt

echo 'effort flee facade oddball rat tool' | grep -owE '\w*(\w)\1\w*'

printf 'spot the the error\nno issues here' | grep -wE '(\w+)\W+\1'

## Known Bugs

grep -m5 -xiE '([a-z]*([a-z])\2[a-z]*){2}' words.txt

grep -m5 -xiE '[a-z]*([a-z])\1[a-z]*([a-z])\2[a-z]*' words.txt

grep -m5 -xiP '([a-z]*([a-z])\2[a-z]*){2}' words.txt

echo 'cocoa' | grep -E '(\bco){2}'

echo 'cocoa' | grep -E '\bco\bco'

echo 'cocoa' | grep -P '(\bco){2}'

echo 'it line with it here sit too' | grep -oE 'with(.*\bit\b){2}'

echo 'it line with it here sit too' | grep -oE 'with.*\bit\b.*\bit\b'

echo 'it line with it here sit too' | grep -oP 'with(.*\bit\b){2}'

echo 'it line with it here sit too' | grep -oE 'with(.*\<it\>){2}'

echo 'it line with it here it too' | grep -oE 'with(.*\<it\>){2}'

echo 'it line with it here it too sit' | grep -oE 'with(.*\<it\>){2}'

echo 'it line with it here it too sit' | grep -oP 'with(.*\bit\b){2}'

