## BRE/ERE vs PCRE subtle differences

echo 'a^2 + b^2 - C*3' | grep 'b^2'

echo 'a^2 + b^2 - C*3' | grep -P 'b^2'

echo 'a^2 + b^2 - C*3' | grep -P 'b\^2'

echo 'int a[5]' | grep '[x[.y]'

echo 'int a[5]' | grep -P '[x[.y]'

echo '5ba\babc2' | grep -o '[a\b]*'

echo '5ba\babc2' | grep -oP '[a\b]*'

echo '5ba\babc2' | grep -oP '[a\\b]*'

echo 'w=y\x+9' | grep -oE '[\w=]+'

echo 'w=y\x+9' | grep -oP '[\w=]+'

echo '123456789abc42az' | grep -E '(.)(.)(.)(.)(.)(.)(.)(.)(.)(.).*\10'

echo '123456789abc42az' | grep -P '(.)(.)(.)(.)(.)(.)(.)(.)(.)(.).*\10'

printf 'blue green\nteal brown' | grep -oz 'g.*n'

printf 'blue green\nteal brown' | grep -ozP 'g.*n'

printf 'blue green\nteal brown' | grep -ozP '(?s)g.*n'

printf 'spared PARTY PaReNt' | grep -ioE 'par|pare|spare'

printf 'spared PARTY PaReNt' | grep -ioP 'par|pare|spare'

printf 'spared PARTY PaReNt' | grep -ioP 'spare|pare|par'

echo 'fig123312apple' | grep -oE 'g[123]+(12apple)?'

echo 'fig123312apple' | grep -oP 'g[123]+(12apple)?'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oE 'ab{,2}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oP 'ab{,2}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | grep -oP 'ab{0,2}c'

cat five_words.txt

printf 'sub\nbit' | grep -f- five_words.txt

grep -e 'sub' -e 'bit' five_words.txt

printf 'sub\nbit' | grep -P -f- five_words.txt

grep -P -e 'sub' -e 'bit' five_words.txt

## String anchors

echo 'hi-hello;top-spot' | grep -oP '\A\w+'

echo 'hi-hello;top-spot' | grep -oP '\w+\z'

echo 'hi-hello;top-spot' | grep -zoP '\w+\z'

echo 'hi-hello;top-spot' | grep -zoP '\w+\Z'

## Escape sequences

echo 'Sample123string42with777numbers' | grep -oP '\d+'

echo 'Sample123string42with777numbers' | grep -oP '\D+'

printf 'blue green\nteal\n' | grep -z $'n\nt'

printf 'blue green\nteal\n' | grep -zP 'n\nt'

## Non-greedy quantifiers

echo 'foot' | grep -oP 'f.?o'

echo 'foot' | grep -oP 'f.??o'

echo 'apple 314' | grep -oP '\d{2,5}'

echo 'apple 314' | grep -oP '\d{2,5}?'

echo 'green:3.14:teal::brown:oh!:blue' | grep -oP ':.*:'

echo 'green:3.14:teal::brown:oh!:blue' | grep -oP ':.*?:'

## Possessive quantifiers

echo 'fig:mango:pineapple:guava' | grep -oP ':.*apple'

echo 'fig:mango:pineapple:guava' | grep -oP ':.*+apple'

echo '0501 035 154 12 26 98234' | grep -woP '0*+\d{3,}'

## Atomic grouping

echo '0501 035 154 12 26 98234' | grep -woP '(?>0*)\d{3,}'

s='fig::mango::pineapple::guava::apples::orange'

echo "$s" | grep -oP '::.*?::apple'

echo "$s" | grep -oP '(?>::.*?::)apple'

## Non-capturing group

printf 'a,b,c,d,e\n1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\2,'

printf 'a,b,c,d,e\n1,2,3,3,5' | grep -P '^(?:[^,]+,){2}([^,]+),\1,'

## Named capture groups

echo '1,2,3,3,5' | grep -P '^(?:[^,]+,){2}(?<col3>[^,]+),\k<col3>,'

echo '1,2,3,3,5' | grep -P '^(?:[^,]+,){2}(?P<col3>[^,]+),(?P=col3),'

## Negative backreferences

echo '1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\g{-1},'

echo '1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\g-1,'

## Subexpression calls

row='today,2008-03-24,food,2012-08-12,nice,5632'

echo "$row" | grep -oP '(\d{4}-\d{2}-\d{2}).*(?1)'

echo "$row" | grep -oP '(?<date>\d{4}-\d{2}-\d{2}).*(?&date)'

## Lookarounds

echo 'fig:cart<apple-rest;tea' | grep -oP '(?<![:-])\b\w+'

printf 'hey cats!\ncat42\ncat_5\ncatcat' | grep -P 'cat(?!\d)'

echo 'fig:cart<apple-rest;tea' | grep -woP '(?<![:-])\w+(?!-|$)'

echo '42 apple-5, fig3; x-83, y-20: f12' | grep -oP '\d+(?=,)'

echo '42 apple-5, fig3; x-83, y-20: f12' | grep -oP '(?<=[a-z])\d+'

echo 'par spare part party' | grep -oP '\b\w*par\w*\b(?=.*\bpart\b)'

echo '42 apple-5, fig3; x-83, y-20: f12' | grep -oP '(?<=-)\d++(?!,)'

echo 'par spare part party' | grep -oP '\b\w++(?<![rt])'

## Conditional AND with lookarounds

grep -P '(?=.*b)(?=.*e).*t' five_words.txt

grep -P '(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u' five_words.txt

grep -P '(?!.*n$)(?=.*a[bt]).*q' five_words.txt

## Variable length lookbehind

s='pore42 tar3 dare7 care5'

echo "$s" | grep -oP '(?<=(?:po|da)re)\d+'

echo "$s" | grep -oP '(?<=\b[a-z]{4})\d+'

echo "$s" | grep -oP '(?<=tar|dare)\d+'

echo "$s" | grep -oP '(?<=\b[a-z]+)\d+'

echo "$s" | grep -oP '(?<=\b[a-z]{1,3})\d+'

echo 'cat scatter cater scat' | grep -oP '(?<=(cat.*?){2})cat[a-z]*'

## Set start of matching portion with \K

echo 'apple=42, fig=314' | grep -oP '=\K\d+'

s='cat scatter cater scat concatenate catastrophic catapult duplicate'

echo "$s" | grep -oP '^(.*?cat.*?){2}\Kcat[a-z]*'

echo "$s" | grep -oP '(.*?cat.*?){2}\Kcat[a-z]*'

echo 'or42 pare7 cat3 cared5' | grep -oP '\b[a-z]{1,3}\K\d+'

## Negated groups

s='fox,cat,dog,parrot'

echo "$s" | grep -qP '^((?!cat).)*dog' || echo 'no match'

echo "$s" | grep -qP '^((?!parrot).)*dog' && echo 'match found'

echo "$s" | grep -qP 'at((?!go).)*par' && echo 'match found'

s='fox,cat,dog,parrot'

echo "$s" | grep -oP '^((?!cat).)*'

echo "$s" | grep -oP '^((?!parrot).)*'

echo "$s" | grep -oP '^((?!(.)\2).)*'

echo "$s" | grep -oP '^((?!lion).)*'

## Conditional groups

cat conditional.txt

grep -xP '(\[)?\w+(?(1)]|-\w+)' conditional.txt

## Modifiers

printf 'Cat\ncOnCaT\nscatter\ncut' | grep -P '(?i)cat'

printf 'Cat\ncOnCaT\nscatter\ncut' | grep -iP '(?-i)cat'

echo 'Cat SCatTeR CATER cAts' | grep -oP 'Cat(?i:[a-z]*)\b'

printf 'Hi there\nHave a Nice Day' | grep -zoP '(?s)the.*ice'

grep -zlP '(?ms)\A\N*\bpython3\b.*^import' five_words.txt script

echo 'fox,cat,dog,parrot' | grep -oP '(?x) ^( (?! (.)\2 ) . )*'

echo 'fox,cat,dog,parrot' | grep -oP '(?x) (,[^,]+){2}$ #last 2 columns'

echo 'fox,cat,dog,parrot' | grep -oP '(,[^,]+){2}$(?#last 2 columns)'

echo 'a cat and a dog' | grep -P '(?x)t a'

echo 'a cat and a dog' | grep -P '(?x)t\ a'

echo 'a cat and a dog' | grep -P '(?x)t[ ]a'

echo 'food a#b 123' | grep -oP '(?x)a#.'

echo 'food a#b 123' | grep -oP '(?x)a\#.'

## \Q and \E

echo 'int a[5]' | grep -P '\Qa[5]'

echo '5b-a\b-abc2' | grep -oP '[\Q\-\Eab]*'

expr='(a^b)'

echo '\S*\Q'"$expr"'\E\S*'

echo 'f*(2-a/b) - 3*(a^b)-42' | grep -oP '\S*\Q'"$expr"'\E\S*'

## \G anchor

echo '123-87-593 42 apple-12-345' | grep -oP '\G\d+-?'

echo 'at_2 bat_100 kite_42' | grep -oP '\G\w(?=\w)'

marks='Joe 75 88 Mina 89 85 84 John 90'

echo "$marks" | grep -oP '(?:Mina|\G) \K\d+'

echo "$marks" | grep -oP '(?:John|\G) \K\d+'

p='Jo:x2 Mina:56 Rohit:abcdef'

echo "$p" | grep -oP '(?:Mina:\K|\G)\S'

echo "$p" | grep -oP '(?:Mina:\K|\G(?!\A))\S'

echo "$p" | grep -oP '(?:Jo:\K|\G(?!\A))\S'

## Skipping matches

words='tiger imp eagle ant important imp2 Cat'

echo "$words" | grep -oP '\b(?:imp|ant)\b(*SKIP)(*F)|\w+'

echo 'I like2 "mango" and "guava"' | grep -oP '"[^"]+"(*SKIP)(*F)|\w+'

## Recursive matching

eqn0='a + (b * c) - (d / e)'

eqn1='((f+x)^y-42)*((3-g)^z+2)'

echo "$eqn0" | grep -oP '\([^()]++\)'

echo "$eqn1" | grep -oP '\([^()]++\)'

echo "$eqn1" | grep -oP '(?x) \( (?: [^()]++ | \([^()]++\) )++ \)'

eqn2='a + (b) + ((c)) + (((d)))'

echo "$eqn2" | grep -oP '(?x) \( (?: [^()]++ | \([^()]++\) )++ \)'

echo "$eqn0" | grep -oP '(?x) \( (?: [^()]++ | (?0) )++ \)'

echo "$eqn1" | grep -oP '(?x) \( (?: [^()]++ | (?0) )++ \)'

echo "$eqn2" | grep -oP '(?x) \( (?: [^()]++ | (?0) )++ \)'

eqn3='(3+a) * ((r-2)*(t+2)/6) + 42 * (a(b(c(d(e)))))'

echo "$eqn3" | grep -oP '(?x) \( (?: [^()]++ | (?0) )++ \)'

## Unicode

echo 'fox:αλεπού,eagle:αετός' | grep -oP '\p{L}+'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '\p{Greek}+'

echo 'φοο12,βτ_4,bat' | grep -oP '\p{Xwd}+'

echo 'φοο12,βτ_4,bat' | grep -oP '\P{L}+'

echo 'a cat and a dog' | grep -P 't\x20a'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '[\x61-\x7a]+'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '[\x{3b1}-\x{3bb}]+'

