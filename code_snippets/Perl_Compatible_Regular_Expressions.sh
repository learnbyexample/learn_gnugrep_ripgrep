echo 'a^2 + b^2 - C*3' | grep 'b^2'

echo 'a^2 + b^2 - C*3' | grep -P 'b^2'

echo 'a^2 + b^2 - C*3' | grep -P 'b\^2'

echo 'int a[5]' | grep '[x[.y]'

echo 'int a[5]' | grep -P '[x[.y]'

echo '5ba\babc2' | grep -o '[a\b]*'

echo '5ba\babc2' | grep -oP '[a\b]*'

echo '5ba\babc2' | grep -oP '[a\\b]*'

echo 'w=y\x+9*3' | grep -oE '[\w=]+'

echo 'w=y\x+9*3' | grep -oP '[\w=]+'

echo '123456789abc42az' | grep -E '(.)(.)(.)(.)(.)(.)(.)(.)(.)(.).*\10'

echo '123456789abc42az' | grep -P '(.)(.)(.)(.)(.)(.)(.)(.)(.)(.).*\10'

printf 'blue green\nteal brown' | grep -oz 'g.*n'

printf 'blue green\nteal brown' | grep -ozP 'g.*n'

printf 'blue green\nteal brown' | grep -ozP '(?s)g.*n'

printf 'spared PARTY PaReNt' | grep -ioE 'par|pare|spare'

printf 'spared PARTY PaReNt' | grep -ioP 'par|pare|spare'

printf 'spared PARTY PaReNt' | grep -ioP 'spare|pare|par'

cat five_words.txt

printf 'sub\nbit' | grep -f- five_words.txt

grep -e 'sub' -e 'bit' five_words.txt 

printf 'sub\nbit' | grep -P -f- five_words.txt

grep -P -e 'sub' -e 'bit' five_words.txt 

echo 'hi-hello;top-spot' | grep -oP '\A\w+'

echo 'hi-hello;top-spot' | grep -oP '\w+\z'

echo 'hi-hello;top-spot' | grep -zoP '\w+\z'

echo 'hi-hello;top-spot' | grep -zoP '\w+\Z'

echo 'Sample123string42with777numbers' | grep -oP '\d+'

echo 'Sample123string42with777numbers' | grep -oP '\D+'

printf 'red\ntea\n' | grep -zP 'n\nt'

printf 'blue green\nteal brown\n' | grep -zP 'n\nt'

echo 'foot' | grep -oP 'f.?o'

echo 'foot' | grep -oP 'f.??o'

echo 'frost' | grep -oP 'f.??o'

echo 'foo 314' | grep -oP '\d{2,5}'

echo 'foo 314' | grep -oP '\d{2,5}?'

echo 'that is quite a fabricated tale' | grep -oP 't.*a'

echo 'that is quite a fabricated tale' | grep -oP 't.*?a'

echo 'that is quite a fabricated tale' | grep -oP 't.*?a.*?f'

printf 'abc\nac\nadc\nxabbbcz\nbbb\nabbbbbc' | grep -oP 'ab*c'

printf 'abc\nac\nadc\nxabbbcz\nbbb\nabbbbbc' | grep -oP 'ab*+c'

echo 'feat ft feaeat' | grep -oP 'f[ae]*at'

echo 'feat ft feaeat' | grep -qP 'f[ae]*+at' || echo 'No match'

echo 'abbbc foooooot' | grep -oP '(?>[bo]+)'

echo 'feat ft feaeat' | grep -qP 'f(?>[ae]*)at' || echo 'No match'

echo '1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\2,'

echo '1,2,3,3,5' | grep -P '^(?:[^,]+,){2}([^,]+),\1,'

echo '1,2,3,3,5' | grep -P '^(?:[^,]+,){2}(?<col3>[^,]+),\k<col3>,'

echo '1,2,3,3,5' | grep -P '^(?:[^,]+,){2}(?P<col3>[^,]+),(?P=col3),'

echo '1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\g{-1},'

echo '1,2,3,3,5' | grep -P '^([^,]+,){2}([^,]+),\g-1,'

row='today,2008-03-24,food,2012-08-12,nice,5632'

echo "$row" | grep -oP '(\d{4}-\d{2}-\d{2}).*(?1)'

echo "$row" | grep -oP '(?<date>\d{4}-\d{2}-\d{2}).*(?&date)'

echo ':cart<apple-rest;tea' | grep -oP '(?<![:-])\b\w+\b'

echo 'boz42 bezt5 bazbiz' | grep -ioP 'b.z(?!\d)'

echo '42 foo-5, baz3; x-83, y-20: f12' | grep -oP '\d+(?=,)'

echo '42 foo-5, baz3; x-83, y-20: f12' | grep -oP '(?<=-)\d++(?!,)'

grep -P '(?=.*b)(?=.*e).*t' five_words.txt

grep -P '(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u' five_words.txt

grep -P '^(?!e)(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u' five_words.txt

echo 'pore42 car3 pare7 care5' | grep -oP '(?<=(?:po|ca)re)\d+'

echo 'pore42 car3 pare7 care5' | grep -oP '(?<=\b[a-z]{4})\d+'

echo 'pore42 car3 pare7 care5' | grep -oP '(?<!car|pare)\d+'

echo 'pore42 car3 pare7 care5' | grep -oP '(?<=\b[a-z]+)\d+'

echo 'pore42 car3 pare7 care5' | grep -oP '(?<=\b[a-z]{1,3})\d+'

echo 'cat scatter cater scat' | grep -oP '(?<=(cat.*?){2})cat[a-z]*'

echo 'foo=42, bar=314' | grep -oP '=\K\d+'

echo 'cat scatter cater scat' | grep -oP '(cat.*?){2}\Kcat[a-z]*'

echo 'or42 car3 pare7 care5' | grep -oP '\b[a-z]{1,3}\K\d+'

echo 'fox,cat,dog,parrot' | grep -qP '^((?!cat).)*dog' || echo 'No match'

echo 'fox,cat,dog,parrot' | grep -qP '^((?!parrot).)*dog' && echo 'Match'

echo 'fox,cat,dog,parrot' | grep -qP 'at((?!go).)*par' && echo 'Match'

echo 'fox,cat,dog,parrot' | grep -oP '^((?!cat).)*'

echo 'fox,cat,dog,parrot' | grep -oP '^((?!parrot).)*'

echo 'fox,cat,dog,parrot' | grep -oP '^((?!(.)\2).)*'

printf 'Cat\ncOnCaT\nscatter\ncut' | grep -P '(?i)cat'

printf 'Cat\ncOnCaT\nscatter\ncut' | grep -iP '(?-i)cat'

echo 'Cat SCatTeR CATER cAts' | grep -oP 'Cat(?i:[a-z]*)\b'

printf 'Hi there\nHave a Nice Day' | grep -zoP '(?s)the.*ice'

grep -zlP '(?ms)\A\N*\bpython3\b.*^import' *

echo 'fox,cat,dog,parrot' | grep -oP '(?x) ^( (?! (.)\2 ) . )*'

echo 'fox,cat,dog,parrot' | grep -oP '(?x) (,[^,]+){2}$ #last 2 columns'

echo 'fox,cat,dog,parrot' | grep -oP '(,[^,]+){2}$(?#last 2 columns)'

echo 'a cat and a dog' | grep -P '(?x)t a'

echo 'a cat and a dog' | grep -P '(?x)t\ a'

echo 'foo a#b 123' | grep -oP '(?x)a#.'

echo 'foo a#b 123' | grep -oP '(?x)a\#.'

echo 'int a[5]' | grep -P '\Qa[5]'

expr='(a^b)'

echo '\S*\Q'"$expr"'\E\S*'

echo 'f*(2-a/b) - 3*(a^b)-42' | grep -oP '\S*\Q'"$expr"'\E\S*'

echo '5b-a\b-abc2' | grep -oP '[\Q\-\Eab]*'

echo '123-87-593 42 foo' | grep -oP '\G\d+-?'

printf '@A-.\tcar' | grep -oP '\G\S'

echo 'car bat cod map' | grep -oP '(bat|map)(*SKIP)(*F)|\w+'

echo 'I like2 "mango" and "guava"' | grep -oP '"[^"]+"(*SKIP)(*F)|\w+'

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

echo 'fox:αλεπού,eagle:αετός' | grep -oP '\p{L}+'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '\p{Greek}+'

echo 'φοο12,βτ_4,foo' | grep -oP '\p{Xwd}+'

echo 'φοο12,βτ_4,foo' | grep -oP '\P{L}+'

echo 'a cat and a dog' | grep -P 't\x20a'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '[\x{61}-\x{7a}]+'

echo 'fox:αλεπού,eagle:αετός' | grep -oP '[\x{3b1}-\x{3bb}]+'

