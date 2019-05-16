link='https://github.com/BurntSushi/ripgrep/releases/'

link="$link"'download/11.0.1/ripgrep_11.0.1_amd64.deb'

wget "$link"

sudo gdebi ripgrep_11.0.1_amd64.deb 

rg --version

rg 'repo' nested_group.txt

rg 're'

man rg

rg -F 'twice' programming_quotes.txt

echo 'int a[5]' | rg -F 'a[5]'

rg -i 'jam' programming_quotes.txt

printf 'Cat\ncOnCaT\nscatter\ncut' | rg -i 'cat'

seq 5 | rg -v '3'

printf 'goal\nrate\neat\npit' | rg -v 'at'

rg -n 'twice' programming_quotes.txt

rg -N 'twice' programming_quotes.txt

rg -c 'in' programming_quotes.txt

printf 'goal\nrate\neat\npit' | rg -vc 'g'

seq 15 | rg -c '1' programming_quotes.txt -

cat <(seq 15) programming_quotes.txt | rg -c '1'

rg -c '1' *

grep -c '1' *

rg -m3 'in' programming_quotes.txt

seq 1000 | rg -m4 '2'

rg -e '1' -e 'two' programming_quotes.txt

printf 'two\n1\n' > search_strings.txt

rg -f search_strings.txt programming_quotes.txt

rg -f search_strings.txt -e 'twice' programming_quotes.txt

rg 'in' programming_quotes.txt | rg 'not'

rg -l 'are' programming_quotes.txt search_strings.txt

rg -l 'xyz' programming_quotes.txt search_strings.txt

rg -l '1' programming_quotes.txt search_strings.txt

rg --files-without-match 'xyz' programming_quotes.txt search_strings.txt

rg --files-without-match 'are' programming_quotes.txt search_strings.txt

rg '1' programming_quotes.txt

seq 1000 | rg -I -m3 '1' - programming_quotes.txt

seq 1000 | rg -m3 '1' - programming_quotes.txt

rg -H '1' programming_quotes.txt

rg --no-heading -H '1' programming_quotes.txt

rg -Hn '1' *.txt | cat -

rg --vimgrep '1' *.txt

vim -q <(rg --vimgrep '1' *.txt)

rg -e '1' -e 'worth' *.txt

rg --color=never 'twice' programming_quotes.txt

rg --color=always 'in' programming_quotes.txt | rg 'not'

rg 'in' programming_quotes.txt | rg 'not'

rg --colors 'match:bg:magenta' 'not' programming_quotes.txt

rg --colors 'match:style:underline' 'not' programming_quotes.txt

rg --color=always 'in' programming_quotes.txt | rg --colors 'match:fg:blue' 'not'

printf 'par value\nheir apparent\n' | rg 'par'

printf 'par value\nheir apparent\n' | rg -w 'par'

printf 'see my book list\nmy book\n' | rg 'my book'

printf 'see my book list\nmy book\n' | rg -x 'my book'

rg -cx '' programming_quotes.txt

rg -Fxf colors_1 colors_2

rg -Fvxf colors_1 colors_2

rg -Fvxf colors_2 colors_1

rg -o -e 'twice' -e 'hard' programming_quotes.txt

rg -c 'in' programming_quotes.txt

rg -co 'in' programming_quotes.txt

rg -A2 'blue' context.txt

rg -B2 'bread' context.txt

rg -C1 'sky' context.txt

rg -A1 -B2 'sky' context.txt

rg -C1 'flower' context.txt

rg -A4 'blue' context.txt

seq 29 | rg --context-separator='*****' -A1 '3'

seq 29 | rg --context-separator='' -A1 '3'

rg -q 'the the' find.md

echo $?

rg -q 'xyz' find.md

echo $?

rg -q 'the the' find.md && echo 'Repeated word found!'

rg 'in' xyz.txt

rg --no-messages 'in' xyz.txt

echo $?

rg 'rose' foo.txt

rg --no-messages 'rose' foo.txt

echo $?

rg --no-messages 'a(' find.md

rg --no-messages 'a(' find.md 2> /dev/null

echo $?

rg -Nb 'is' find.md

rg -Nob 'is' find.md

printf 'spared no one\npar\nspar\ndare' | rg '^pa'

printf 'spared no one\npar\nspar\ndare' | rg 'ar$'

printf 'spared no one\npar\nspar\ndare' | rg '^par$'

rg '\bpar' word_anchors.txt

rg 'par\b' word_anchors.txt

rg '\bpar\b' word_anchors.txt

rg '\Bpar\B' -r 'PAR' word_anchors.txt

rg '\Bpar' word_anchors.txt

rg 'par\B' word_anchors.txt

printf 'copper' | rg '\b' -r ':'

printf 'copper' | rg '\B' -r ':'

printf 'hi-hello;top\nfoo-spot\n' | rg -U '\Ahi'

printf 'hi-hello;top\nfoo-spot\n' | rg -U '\Afoo'

printf 'hi-hello;top\nfoo-spot\n' | rg -U '^foo'

printf 'hi-hello;top\nfoo-spot\n' | rg -U 'pot\n\z'

printf 'hi-hello;top\nfoo-spot\n' | rg -U 'pot$'

printf 'hi-hello;top\nfoo-spot\n' | rg -U 'top$'

printf 'I like cats\nI like parrots\nI like dogs' | rg 'cat|dog'

echo 'CATs dog bee parrot FoX' | rg -io 'cat|dog|fox'

echo 'CATs dog bee parrot FoX' | rg -i 'cat|dog|fox' -r 'mammal'

rg '^a|e\b' word_anchors.txt

rg 'sub|put|tar|$' word_anchors.txt

printf 'spared PARTY PaReNt' | rg -io 'par|pare|spare'

printf 'spared PARTY PaReNt' | rg -io 'spare|pare|par'

echo 'best years' | rg 'year|years' -r 'X'

echo 'best years' | rg 'years|year' -r 'X'

printf 'red\nreform\nread\narrest' | rg 're(form|st)'

printf 'sub par\nspare\npart time' | rg '\b(par|part)\b'

echo 'a^2 + b^2 - C*3' | rg 'b\^2'

printf '(a/b) + c\n3 + (a/b) - c' | rg '^\(a/b\)'

echo 'tac tin cot abc:tuv excite' | rg -o 'c.t'

printf '42\t33\n' | rg '2.3' -r '8'

rg -Nx 'c..(t|l)y' words.txt

printf 'sub par\nspare\npart time' | rg -w 'part?'

echo 'par part parrot parent' | rg 'par(ro)?t' -r 'X'

echo 'par part parrot parent' | rg -o 'par(en|ro)?t'

echo 'fd fed fod fe:d feeeeder' | rg -o 'fe*d'

echo '3111111111125111142' | rg '1*2' -r 'X'

echo 'fd fed fod fe:d feeeeder' | rg -o 'f(e|o|:)+d'

echo '3111111111125111142' | rg -o '1+2'

echo '3111111111125111142' | rg '1+4?2' -r 'X'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{1,4}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{3,}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{3}c'

echo 'abc ac adc abbc xabbbcz bbb bc abbbbbc' | rg -o 'ab{0,2}c'

echo 'Error: not a valid input' | rg -o 'Error.*valid'

echo 'a cat and a dog' | rg 'cat.*dog|dog.*cat'

echo 'dog and cat' | rg 'cat.*dog|dog.*cat'

echo 'foot' | rg 'f.?o' -r 'X'

echo 'car bat cod map scat dot abacus' | rg -o '.*'

echo 'car bat cod map scat dot abacus' | rg -o '.*m'

echo 'car bat cod map scat dot abacus' | rg -o 'c.*t'

echo 'car bat cod map scat dot abacus' | rg -o 'c.*at'

echo 'car bat cod map scat dot abacus' | rg -o 'b.*m*'

echo 'foot' | rg 'f.??o' -r 'X'

echo 'frost' | rg 'f.??o' -r 'X'

echo 'foo 314' | rg -o '\d{2,5}?'

echo 'that is quite a fabricated tale' | rg -o 't.*a'

echo 'that is quite a fabricated tale' | rg -o 't.*?a'

printf 'meeting\ncute\nboat\nsite\nfoot' | rg '[aeo]+t'

echo 'so in to no on' | rg -w '[sot][on]' -r 'X'

rg -Nx '[on]{2,}' words.txt

echo 'Sample123string42with777numbers' | rg -o '[0-9]+'

echo 'coat Bin food tar12 best' | rg -w '[a-z0-9]+' -r 'X'

echo 'road i post grip read eat pit' | rg -w '[p-z][a-z]*' -r 'X'

echo '23 154 12 26 34' | rg -ow '[12][0-9]'

echo '0501 035 154 12 26 98234' | rg -ow '0*[1-9][0-9]{2,}'

echo 'Sample123string42with777numbers' | rg '[^0-9]+' -r 'X'

echo 'foo:123:bar:baz' | rg -o '(:[^:]+){2}$'

echo 'I like "mango" and "guava"' | rg -o '"[^"]+"'

printf 'tryst\nfun\nglyph\npity\nwhy' | rg -v '[aeiou]'

echo 'Sample123string42with777numbers' | rg '\d+' -r ':'

echo 'Sample123string42with777numbers' | rg '\D+' -r ':'

printf 'lo2ad.;.err_msg--\nant,;.' | rg -o '\w+'

echo 'tea sea-pit sit-lean bean' | rg -o '[\w\s]+'

printf 'errMsg\nant2\nm_2\n' | rg -x '[[:alnum:]]+'

echo 'pie tie#ink-eat_42;' | rg -o '[[:^punct:]]+'

echo 'tryst glyph pity why' | rg -ow '[a-z&&[^aeiou]]+'

echo 'gets eat top sigh' | rg -ow '[[a-l]~~[g-z]]+'

para='"Hi", there! How *are* you? All fine here.'

echo "$para" | rg '[[:punct:]--[.!?]]+' -r ''

echo 'ab-cd gh-c 12-423' | rg -ow '[a-z-]{2,}'

printf 'int a[5]\nfoo\n1+1=2\n' | rg '[]=]'

echo 'int a[5]' | rg '[x\[.y]'

echo 'f*(a^b) - 3*(a+b)/(a-b)' | rg -o 'a[+^]b'

echo '[52] apples [and] [31] mangoes' | rg '\[(\d+)]' -r '$1'

echo '52 apples and 31 mangoes' | rg '\d+' -r '(${0}4)'

echo '_foo_ __123__ _baz_' | rg '(_)?_' -r '$1'

echo 'a,b 42,24' | rg '(\w+),(\w+)' -r '$2,$1'

echo '1,2,3,4,5,6,7' | rg '^(([^,]+,){3})([^,]+)' -r '$1($3)'

echo '1,2,3,4,5,6,7' | rg '^((?:[^,]+,){3})([^,]+)' -r '$1($2)'

echo 'a,b 42,24' | rg '(?P<fw>\w+),(?P<sw>\w+)' -r '$sw,$fw'

row='today,2008-24-03,food,2012-12-08,nice,5632'

echo "$row" | rg '(?P<dd>-\d{2})(?P<mm>-\d{2})' -r '$mm$dd'

echo 'foo=42, bar=314, baz:512' | rg -o '=(\d+)' -r '$1'

echo '42 foo-5, baz3; x-83, y-20: f12' | rg -o '\-(\d+)[:;]' -r '$1'

echo 'cat scatter cater scat' | rg -o '(?:cat.*?){2}(cat[a-z]*)' -r '$1'

echo 'Cat cOnCaT scatter cut' | rg '(?i)cat' -r 'X'

printf 'Cat\ncOnCaT\nscatter\ncut' | rg -i '(?-i)cat'

echo 'Cat SCatTeR CATER cAts' | rg 'Cat(?i:[a-z]*)\b' -r 'X'

printf 'Hi there\nHave a Nice Day' | rg -U '(?s)the.*ice' -r ''

printf 'Hi there\nHave a Nice Day' | rg -Uo '(?is)the.*day'

rg -Ul '\A.*\bpython3\b(?s).*^import'

rg -Ul '(?-m)\A.*\bpython3\b(?s).*^import'

echo 'fox,cat,dog,parrot' | rg -o '(?x) ( ,[^,]+ ){2}$ #last 2 columns'

echo 'a cat and a dog' | rg '(?x)t a'

echo 'a cat and a dog' | rg '(?x)t\ a'

echo 'foo a#b 123' | rg -o '(?x)a#.'

echo 'foo a#b 123' | rg -o '(?x)a\#.'

echo 'fox:αλεπού,eagle:αετός' | rg '\p{L}+' -r '($0)'

echo 'fox:αλεπού,eagle:αετός' | rg -o '\p{Greek}+'

echo 'φοο12,βτ_4,foo' | rg '\w+' -r '[$0]'

echo 'φοο12,βτ_4,foo' | rg '(?-u)\w+' -r '[$0]'

echo 'φοο12,βτ_4,foo' | rg -o '\P{L}+'

echo 'a cat and a dog' | rg 't\x20a'

echo 'fox:αλεπού,eagle:αετός' | rg -o '[\x61-\x7a]+'

echo 'fox:αλεπού,eagle:αετός' | rg -o '[\x{3b1}-\x{3bb}]+'

echo '1a42z' | grep -oP '[a-z]*'

echo '1a42z' | rg -oP '[a-z]*'

printf 'sub\nbit' | grep -P -f- five_words.txt

printf 'sub\nbit' | rg -P -f- five_words.txt

rg -P '(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u' five_words.txt

echo 'hey food! foo42 foot5 foofoo' | rg -P 'foo(?!\d)' -r 'X'

echo 'cat scatter cater scat' | rg -oP '(cat.*?){2}\Kcat[a-z]*'

echo 'fox,cat,dog,parrot' | rg -qP 'at((?!go).)*par' && echo 'Match'

echo 'a a a walking for for a cause' | rg -P '\b(\w+)( \1)+\b' -r '$1'

expr='(a^b)'

echo 'f*(2-a/b) - 3*(a^b)-42' | rg -oP '\S*\Q'"$expr"'\E\S*'

echo 'car bat cod map' | rg -o '(bat|map)(*SKIP)(*F)|\w+'

echo 'car bat cod map' | rg -o --auto-hybrid-regex '(bat|map)(*SKIP)(*F)|\w+'

tree -al

rg --files

mkdir .git

echo 'patterns.txt' > .gitignore

rg -wl 'obscure|are'

rg --no-ignore -wl 'obscure|are'

cp patterns.txt .git/pat.txt

rg -l 'obscure|ne'

rg --hidden -l 'obscure|ne'

rg 'red'

rg -Ll 'red'

rg -t=py -t=sh --files

rg -t=txt --files

rg -T=txt --files

rg -g='*.{sh,py}' --files

rg -g='*gr*' --files

rg -g='!*.py' --files

rg -g='!scripts' --files

perl -0777 -pe 'print $_ x 2000' scarlet_pimpernel.txt | shuf > large.txt

