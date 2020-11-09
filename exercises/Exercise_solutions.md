# Exercise solutions

<br>

# Frequently used options

Create `exercises` directory and within it, create another directory for this chapter, say `freq_options` or `chapter_2`. Input is a file downloaded from internet — https://www.gutenberg.org/files/345/345.txt saved as `dracula.txt`.

**a)** Display all lines containing `ablaze`

```bash
$ mkdir -p exercises/freq_options && cd $_
$ wget https://www.gutenberg.org/files/345/345.txt -O dracula.txt

$ grep 'ablaze' dracula.txt
the room, his face all ablaze with excitement. He rushed up to me and
```

**b)** Display all lines containing `abandon` as a whole word.

```bash
$ grep -w 'abandon' dracula.txt
inheritors, being remote, would not be likely to abandon their just
```

**c)** Display all lines that satisfies both of these conditions:

* `professor` matched irrespective of case
* either `quip` or `sleep` matched case sensitively

```bash
$ grep -i 'professor' dracula.txt | grep -e 'quip' -e 'sleep'
equipment of a professor of the healing craft. When we were shown in,
its potency; and she fell into a deep sleep. When the Professor was
sleeping, and the Professor seemingly had not moved from his seat at her
to sleep, and something weaker when she woke from it. The Professor and
```

**d)** Display first three lines containing `Count`

```bash
$ grep -m3 'Count' dracula.txt
town named by Count Dracula, is a fairly well-known place. I shall enter
must ask the Count all about them.)
Count Dracula had directed me to go to the Golden Krone Hotel, which I
```

**e)** Display first six lines containing `Harker` but not either of `Journal` or `Letter`

```bash
$ grep -v -e 'Journal' -e 'Letter' dracula.txt | grep -m6 'Harker'
said, "The Herr Englishman?" "Yes," I said, "Jonathan Harker." She
"I am Dracula; and I bid you welcome, Mr. Harker, to my house. Come in;
I shall be all alone, and my friend Harker Jonathan--nay, pardon me, I
Jonathan Harker will not be by my side to correct and aid me. He will be
"I write by desire of Mr. Jonathan Harker, who is himself not strong
junior partner of the important firm Hawkins & Harker; and so, as you
```

**f)** Display lines containing `Zooelogical Gardens` along with line number prefix.

```bash
$ grep -n 'Zooelogical Gardens' dracula.txt
5597:         _Interview with the Keeper in the Zooelogical Gardens._
5601:the keeper of the section of the Zooelogical Gardens in which the wolf
8042:the Zooelogical Gardens a young one may have got loose, or one be bred
```

**g)** Find total count of whole word `the` (irrespective of case).

```bash
$ grep -iow 'the' dracula.txt | wc -l
8090
```

**h)** The below code snippet tries to get number of empty lines, but apparently shows wrong result, why?

```bash
$ grep -cx '' dracula.txt
0
```

If you use the `file` command, you'll see that the input file has dos-style line endings. So, there are no empty lines because there's at least `\r` character in every line other than the newline character.

```bash
$ file dracula.txt 
dracula.txt: ASCII text, with CRLF line terminators

$ grep -cx $'\r' dracula.txt
2559
```

<br>

# BRE/ERE Regular Expressions

**a)** Extract all pairs of `()` with/without text inside them, provided they do not contain `()` characters inside.

```bash
$ echo 'I got (12) apples' | grep -o '([^()]*)'
(12)

$ echo '((2 +3)*5)=25 and (4.3/2*()' | grep -o '([^()]*)'
(2 +3)
()
```

**b)** For the given input, match all lines that start with `den` or end with `ly`

```bash
$ lines='lovely\n1 dentist\n2 lonely\neden\nfly away\ndent'
$ printf '%b' "$lines" | grep -E '^den|ly$'
lovely
2 lonely
dent
```

**c)** Extract all whole words that contains `42` but not at edge of word. Assume a word cannot contain `42` more than once.

```bash
$ echo 'hi42bye nice1423 bad42 cool_42a 42fake' | grep -oE '\w+42\w+'
hi42bye
nice1423
cool_42a
```

**d)** Each line in given input contains a single word. Match all lines containing `car` but not as a whole word.

```bash
$ printf 'car\nscar\ncare\npot\nscare\n' | grep -E '\Bcar|car\B'
scar
care
scare
```

**e)** For `dracula.txt` file, count the total number of lines that contain `removed` or `rested` or `received` or `replied` or `refused` or `retired` as whole words.

```bash
$ grep -wcE 're(mov|st|ceiv|pli|fus|tir)ed' freq_options/dracula.txt
73
```

**f)** Extract words starting with `s` and containing `e` and `t` in any order.

```bash
$ words='sequoia subtle exhibit sets tests sit'
$ echo "$words" | grep -ow 's\w*t\w*' | grep 'e'
subtle
sets
```

**g)** Extract all whole words having the same first and last character.

```bash
$ echo 'oreo not a pip roar took 22' | grep -owE '\w|(\w)\w*\1'
oreo
a
pip
roar
22
```

**h)** Match all lines containing `*[5]`

```bash
$ printf '4*5]\n(9-2)*[5]\n[5]*3\nr*[5\n' | grep -F '*[5]'
(9-2)*[5]
```

**i)** For the given quantifiers, what would be the equivalent form using `{m,n}` representation?

* `?` is same as `{,1}`
* `*` is same as `{0,}`
* `+` is same as `{1,}`

**j)** In ERE, `(a*|b*)` is same as `(a|b)*` — True or False?

False. Because `(a*|b*)` will match only sequences like `a`, `aaa`, `bb`, `bbbbbbbb`. But `(a|b)*` can match a mixed sequence like `ababbba` too.

**k)** `grep -wE '[a-z](on|no)[a-z]'` is same as `grep -wE '[a-z][on]{2}[a-z]'`. True or False? Sample input shown below might help to understand the differences, if any.

False. `[on]{2}` will also match `oo` and `nn`.

```bash
$ printf 'known\nmood\nknow\npony\ninns\n'
known
mood
know
pony
inns
```

**l)** Display all lines that start with `hand` and ends with no further character or `s` or `y` or `le`.

```bash
$ lines='handed\nhand\nhandy\nunhand\nhands\nhandle\n'
$ printf '%b' "$lines" | grep -xE 'hand([sy]|le)?'
hand
handy
hands
handle
```

<br>

# Context matching

**a)** For this question, create `exercises/context_matching` directory and then save [this file from learn_gnugrep_ripgrep repo](https://raw.githubusercontent.com/learnbyexample/learn_gnugrep_ripgrep/master/exercises/palindrome.py) as `palindrome.py`. For this input file, display all lines matching `raise` and one line before it.

```bash
$ # assumes 'exercises/context_matching' as CWD
$ grep -B1 'raise' palindrome.py
    if re.search(r'[^a-zA-Z]', ip_str):
        raise ValueError("Characters other than alphabets and punctuations")
    elif len(ip_str) < 3:
        raise ValueError("Less than 3 alphabets")
```

**b)** Input has group of lines with single empty line in between. Change it to double empty lines between groups.

```bash
$ lines='rat\ndog\nbat\n\n42\n3.14\n\nhi there\nhave a nice day'
$ printf '%b' "$lines" | grep --group-separator=$'\n' -A0 '.'
rat
dog
bat


42
3.14


hi there
have a nice day
```

<br>

# Recursive search

For sample directory, a particular version of one of my GitHub repo is used. All the exercises will assume recursive searching, unless otherwise specified. There are no symbolic links.

```bash
$ # assumes 'exercises' as CWD
$ mkdir recursive_searching && cd $_
$ repo='https://github.com/learnbyexample/Command-line-text-processing.git'
$ git clone -b apr19 "$repo"
$ cd Command-line-text-processing
```

**a)** List all files containing `xargs` or `python3`

```bash
$ grep -rlE 'xargs|python3'
gnu_grep.md
miscellaneous.md
wheres_my_file.md
exercises/GNU_grep/ex07_recursive_search/progs/hello.py
README.md
```

**b)** List all files containing `grep` but do not list if they are from `.git` or `exercises` directories.

```bash
$ grep --exclude-dir='.git' --exclude-dir='exercises' -rl 'grep'
gnu_grep.md
sorting_stuff.md
file_attributes.md
whats_the_difference.md
wheres_my_file.md
gnu_sed.md
gnu_awk.md
tail_less_cat_head.md
README.md
ruby_one_liners.md
perl_the_swiss_knife.md
```

**c)** List all files containing `baz` if the filename ends with `.txt` but do not search hidden directories.

```bash
$ grep --include='*.txt' --exclude-dir='.*' -rl 'baz'
exercises/GNU_grep/ex12_regex_character_class_part1/sample_words.txt
exercises/GNU_grep/ex16_misc_and_extras/sample.txt
exercises/GNU_grep/ex08_search_pattern_from_file.txt
```

**d)** Search files ending with `.md` only in current directory (i.e. no recursive searching) and count the total number of occurrences of whole words `grep` or `sed` or `awk`.

```bash
$ grep -owE 'grep|sed|awk' *.md | wc -l
1532
```

**e)** List all files containing `Hello` unless the filename ends with `.txt` or `.sh`

```bash
$ grep --exclude='*.txt' --exclude='*.sh' -rl 'Hello'
gnu_grep.md
miscellaneous.md
file_attributes.md
whats_the_difference.md
gnu_sed.md
gnu_awk.md
tail_less_cat_head.md
exercises/GNU_grep/ex07_recursive_search/progs/hello.py
ruby_one_liners.md
perl_the_swiss_knife.md
```

**f)** List all files containing whole words `awk` and `perl` but not `basename`. Although not the case here, assume that filenames can contain shell special characters like space, semicolon, newline, etc.

```bash
$ grep -rlwZ 'awk' | xargs -0 grep -lwZ 'perl' | xargs -0 grep -Lw 'basename'
sorting_stuff.md
gnu_sed.md
gnu_awk.md
ruby_one_liners.md
perl_the_swiss_knife.md
```

<br>

# Miscellaneous options

**a)** Use the correct binary option to get output for second command shown below:

```bash
$ printf 'hi there\0good day\n' | grep 'good'
Binary file (standard input) matches

$ printf 'hi there\0good day\n' | grep -a 'good'
hi theregood day
```

**b)** Read about `--line-buffered` from the manual (also [this link](https://stackoverflow.com/questions/7161821/how-to-grep-a-continuous-stream)) and see it in action with code below:

```bash
$ for i in {1..5}; do seq 12; sleep 1; done | grep '[1-489]' | grep -v '0'

$ for i in {1..5}; do seq 12; sleep 1; done | grep --line-buffered '[1-489]' | grep -v '0'
```

**c)** Consider non-binary input having multiple lines of text. Display `Match` if input starts with a number and `Nope` if it doesn't.

```bash
$ printf 'oh\n42' | grep -qz '^[0-9]' && echo 'Match' || echo 'Nope'
Nope
$ printf '2a\nhi' | grep -qz '^[0-9]' && echo 'Match' || echo 'Nope'
Match
```

<br>

# Perl Compatible Regular Expressions

**a)** Filter all lines that satisfy all of these rules:

* should have at least two alphabets
* should have at least 3 digits
* should have at least one special character among `%` or `*` or `#` or `$`
* should not end with a whitespace character

```bash
$ pswds='hunter2\nF2H3u#9\n*X3Yz3.14\t\nr2_d2_42\nA $ C1234'
$ printf "$pswds" | grep -P '(?=(.*[a-zA-Z]){2})(?=(.*\d){3})(?!.*\s$).*[%*#$]'
F2H3u#9
A $ C1234
```

**b)** Extract all fields from second to second last from the given rows having `,` as delimiter. There shouldn't be empty lines in output.

```bash
$ printf 'foo,abc\ncat,x,dog' | grep -oP ',\K.+(?=,)'
x
$ echo 'foo,42,baz,3.14,abc' | grep -oP ',\K.+(?=,)'
42,baz,3.14
```

**c)** Create `exercises/pcre` directory and then save [this file from learn_gnugrep_ripgrep repo](https://github.com/learnbyexample/learn_gnugrep_ripgrep/raw/master/exercises/price.txt) as `price.txt`. For this input file, match lines if it contains `qty` followed by `price` but not if there is **whitespace** or the string **error** between them.

```bash
$ # assumes 'exercises/pcre' as CWD
$ cat price.txt
23,qty,price,42
qty price,oh
3.14,qty,6,errors,9,price,3
42 qty-6,apple-56,price-234,error
4,price,3.14,qty,4
4,qtyprice,3

$ grep -P 'qty((?!\s|error).)*price' price.txt
23,qty,price,42
42 qty-6,apple-56,price-234,error
4,qtyprice,3
```

**d)** Correct the command to get output as shown below. Problem statement is to find sequence of duplicate word characters, with the second occurrence matching just before a newline character.

```bash
$ # no output
$ printf '2\nice\nwater\nNice\n42' | grep -zoP '(\w+).*\1\n'

$ # correct the command to get expected output as shown
$ printf '2\nice\nwater\nNice\n42' | grep -zoP '(?s)(\w+).*\1\n'
ice
water
Nice
```

**e)** Extract all whole words except those that start with `p` or `e` or `n`

```bash
$ echo 'a pip at tea top earn row nice' | grep -woP '\b[^pen]\w*'
a
at
tea
top
row
```

<br>

# ripgrep

Would be a good idea to first redo all the exercises using `rg` from all the previous chapters. Some exercises will require reading the manual, as those options aren't covered in the chapter.

**a)** Go through the manual and find an option that will change the line separator from `\n` to `\r\n`. See [Frequently used options](#frequently-used-options) section for details about the input file used here.

```bash
$ # assumes 'exercises/freq_options' as CWD

$ # no output
$ rg -cx '' dracula.txt

$ rg --crlf -cx '' dracula.txt
2559
```

**b)** Commands like `sed` and `perl` require special care if you need to search and replace a text literally. `rg` provides an easier alternative, which can be seen with these exercises.

```bash
$ # replace [4]* with 2
$ printf '2.3/[4]*6\nfoo\n5.3-[4]*9\n' | rg --passthru -F '[4]*' -r '2'
2.3/26
foo
5.3-29

$ # replace '3$a with &
$ printf "a'3\$a\nb'3\$a6\nc\n" | rg --passthru -F \''3$a' -r '&'
a&
b&6
c
```

**c)** Create `exercises/ripgrep` directory and then save [this file from learn_gnugrep_ripgrep repo](https://github.com/learnbyexample/learn_gnugrep_ripgrep/raw/master/exercises/sample.md) as `sample.md`. For this input file, match all lines containing `ruby` irrespective of case, but not if it is part of code blocks that are bounded by triple backticks.

```bash
$ # assumes 'exercises' as CWD
$ mkdir ripgrep && cd $_

$ rg -iPU '(?s)^```.*?^```(*SKIP)(*F)|ruby' sample.md
3:REPL is a good way to learn RUBY for beginners.
16:ruby comes loaded with awesome methods. Enjoy learning RuBy.
```

**d)** Sum all integer numbers (floating-point numbers should be ignored) if the file also contains the string `is`

```bash
$ # assumes 'exercises/ripgrep' as CWD
$ # which already has one file named 'sample.md'

$ # create two more files with these commands
$ echo 'hi,31,3.14,bye' > 'space in filename.txt'
$ echo 'This is 2 good' > $'weird \n symbols'

$ # all three files should be considered as input
$ # use awk '{s+=$1} END{print s}' if datamash is not available
$ rg -0 -l 'is' | xargs -0 rg -oIP '\d++\.\d++(*SKIP)(*F)|\d++' | datamash sum 1
61
```

**e)** Default behavior changes depending upon output is intended for terminal or not. Use appropriate option(s) to get the output as shown below. Search for `good way` or `bye` in all the files in the given directory and save the output in `out.txt` file.

```bash
$ # assumes 'exercises/ripgrep' as CWD

$ rg -n --heading 'good way|bye' > out.txt
$ cat out.txt
space in filename.txt
1:hi,31,3.14,bye

sample.md
3:REPL is a good way to learn RUBY for beginners.
```

**f)** Which option will show both line number and 1-based byte offset of first matching portion for matching lines?

```bash
$ # assumes 'exercises/ripgrep' as CWD

$ # normal output
$ rg 'good' sample.md
3:REPL is a good way to learn RUBY for beginners.

$ # expected output
$ rg -I --vimgrep 'good' sample.md
3:11:REPL is a good way to learn RUBY for beginners.
```

**g)** By default, `ripgrep` uses `\n` as the line separator. Use appropriate option to change the separator to `NUL` and display all lines containing `red` for the given input.

```bash
$ printf 'dark red\nteal\n\0brown\n\0spared' | rg --null-data 'red'
dark red
teal
spared
```

**h)** Use appropriate options to replace all `NUL` characters with `---` and a newline character as shown below.

```bash
$ printf 'dark red\nteal\n\0brown\n\0spared' | rg -a --passthru '\x00' -r $'---\n'
dark red
teal
---
brown
---
spared
```

