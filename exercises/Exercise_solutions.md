# Exercise solutions

<br>

# Frequently used options

**1)** Display lines containing `an` from the `sample.txt` input file.

```bash
$ grep 'an' sample.txt
banana
mango
```

**2)** Display lines containing `do` as a whole word from the `sample.txt` input file.

```bash
$ grep -w 'do' sample.txt
Just do-it
```

**3)** Display lines from `sample.txt` that satisfy both of these conditions:

* `he` matched irrespective of case
* either `World` or `Hi` matched case sensitively

```bash
$ grep -i 'he' sample.txt | grep -e 'World' -e 'Hi'
Hello World
Hi there
```

**4)** Display lines from `code.txt` containing `fruit[0]` literally.

```bash
$ grep -F 'fruit[0]' code.txt
fruit[0] = 'apple'
```

**5)** Display only the first two matching lines containing `t` from the `sample.txt` input file.

```bash
$ grep -m2 't' sample.txt
Hi there
Just do-it
```

**6)** Display only the first three matching lines that do *not* contain `he` from the `sample.txt` input file.

```bash
$ grep -m3 -v 'he' sample.txt
Hello World

How are you
```

**7)** Display lines from `sample.txt` that contain `do` along with line number prefix.

```bash
$ grep -n 'do' sample.txt
6:Just do-it
13:Much ado about nothing
```

**8)** For the input file `sample.txt`, count the number of times the string `he` is present, irrespective of case.

```bash
$ grep -io 'he' sample.txt | wc -l
5
```

**9)** For the input file `sample.txt`, count the number of empty lines.

```bash
$ grep -cx '' sample.txt
4
```

**10)** For the input files `sample.txt` and `code.txt`, display matching lines based on the search terms (one per line) present in the `terms.txt` file. Results should be prefixed with the corresponding input filename.

```bash
$ cat terms.txt
are
not
go
fruit[0]

$ grep -Ff terms.txt sample.txt code.txt
sample.txt:How are you
sample.txt:mango
sample.txt:Much ado about nothing
sample.txt:Adios amigo
code.txt:fruit[0] = 'apple'
```

**11)** For the input file `sample.txt`, display lines containing `amigo` prefixed by the input filename as well as the line number.

```bash
$ grep -Hn 'amigo' sample.txt
sample.txt:15:Adios amigo
```

**12)** For the input files `sample.txt` and `code.txt`, display only the filename if it contains `apple`.

```bash
$ grep -l 'apple' sample.txt code.txt
code.txt
```

**13)** For the input files `sample.txt` and `code.txt`, display only whole matching lines based on the search terms (one per line) present in the `lines.txt` file. Results should be prefixed with the corresponding input filename as well as the line number.

```bash
$ cat lines.txt
banana
fruit = []

$ grep -Fnxf lines.txt sample.txt code.txt
sample.txt:9:banana
code.txt:1:fruit = []
```

**14)** For the input files `sample.txt` and `code.txt`, count the number of lines that do *not* match any of the search terms (one per line) present in the `terms.txt` file.

```bash
$ grep -vcFf terms.txt sample.txt code.txt
sample.txt:11
code.txt:3
```

**15)** Count the total number of lines containing `banana` in the input files `sample.txt` and `code.txt`.

```bash
$ cat sample.txt code.txt | grep -c 'banana'
2
```

**16)** Which two conditions are necessary for the output of the `grep` command to be suitable for the `vim -q` quickfix mode?

Filename and line number prefix. Using `grep -Hn` would ensure that these conditions are met.

**17)** What's the default setting for the `--color` option? Give an example where the `always` setting would be useful.

* `auto` will result in color highlighting when results are displayed on terminal, but not when the output is redirected to another command, file, etc. This is the default setting
* `always` will result in color highlighting when results are displayed on terminal as well as when the output is redirected to another command, file, etc

Using `--color=always` is handy if you want to retain color information even when the output is redirected. For example, piping the results to `less -R`, to `grep --color` and so on.

**18)** The command shown below tries to get the number of empty lines, but apparently shows the wrong result, why?

```bash
$ grep -cx '' dos.txt
0
```

If you use the `file` command, you'll see that the input file has dos-style line endings. So, there are no empty lines because the `\r` character is present in every line in addition to the newline character.

```bash
$ file dos.txt
dos.txt: ASCII text, with CRLF line terminators

$ grep -cx $'\r' dos.txt
4
```

<br>

# BRE/ERE Regular Expressions

**1)** For the input file `patterns.txt`, extract from `(` to the next occurrence of `)` unless they contain parentheses characters in between.

```bash
$ grep -o '([^()]*)' patterns.txt
(division)
(#modulo)
(9-2)
()
(j/k-3)
(greeting)
(b)
```

**2)** For the input file `patterns.txt`, match all lines that start with `den` or end with `ly`.

```bash
$ grep -E '^den|ly$' patterns.txt
2 lonely
dent
lovely
```

**3)** For the input file `patterns.txt`, extract all whole words containing `42` surrounded by word characters on both sides.

```bash
$ grep -oE '\w+42\w+' patterns.txt
Hi42Bye
nice1423
cool_42a
_42_
```

**4)** For the input file `patterns.txt`, match all lines containing `car` but not as a whole word.

```bash
$ grep -E '\Bcar|car\B' patterns.txt
scar
care
a huge discarded pile of books
scare
part cart mart
```

**5)** Count the total number of times the whole words `removed` or `rested` or `received` or `replied` or `refused` or `retired` are present in the `patterns.txt` file.

```bash
$ grep -owE 're(ceiv|mov|pli|fus|tir|st)ed' patterns.txt | wc -l
9
```

**6)** For the input file `patterns.txt`, match lines starting with `s` and containing `e` and `t` in any order.

```bash
# can also use: grep '^s.*t' patterns.txt | grep 'e'
$ grep -E '^s.*(e.*t|t.*e)' patterns.txt
sets tests
site cite kite bite
subtle sequoia
```

**7)** From the input file `patterns.txt`, extract all whole lines having the same first and last word character.

```bash
# can also use: grep -xE '\w|(\w).*\1' patterns.txt
$ grep -xE '(\w)(.*\1)?' patterns.txt
sets tests
Not a pip DOWN
y
1 dentist 1
_42_
```

**8)** For the input file `patterns.txt`, match all lines containing `*[5]` literally.

```bash
$ grep -F '*[5]' patterns.txt
(9-2)*[5]
```

**9)** For the given quantifiers, what would be the equivalent form using the `{m,n}` representation?

* `?` is same as `{,1}`
* `*` is same as `{0,}`
* `+` is same as `{1,}`

**10)** In ERE, `(a*|b*)` is same as `(a|b)*` — True or False?

False. Because `(a*|b*)` will match only sequences like `a`, `aaa`, `bb`, `bbbbbbbb`. But `(a|b)*` can match a mixed sequence like `ababbba` too.

**11)** `grep -wE '[a-z](on|no)[a-z]'` is same as `grep -wE '[a-z][on]{2}[a-z]'`. True or False? Sample input shown below might help to understand the differences, if any.

False. `[on]{2}` will also match `oo` and `nn`.

```bash
$ printf 'known\nmood\nknow\npony\ninns\n'
known
mood
know
pony
inns
```

**12)** For the input file `patterns.txt`, display all lines starting with `hand` and ending immediately with `s` or `y` or `le` or no further characters.

```bash
$ grep -xE 'hand([sy]|le)?' patterns.txt
handle
handy
hands
hand
```

**13)** For the input files `patterns.txt`, display matching lines based on the patterns (one per line) present in the `regex_terms.txt` file.

```bash
$ cat regex_terms.txt
^[c-k].*\W$
ly.
[A-Z].*[0-9]

$ grep -f regex_terms.txt patterns.txt
Hi42Bye nice1423 bad42
fly away
def factorial()
hand 
```

**14)** Will the ERE pattern `^a\w+([0-9]+:fig)?` match the same characters for the input `apple42:banana314` and `apple42:fig100`? If not, why not?

```bash
$ echo 'apple42:banana314' | grep -oE '^a\w+([0-9]+:fig)?'
apple42

$ echo 'apple42:fig100' | grep -oE '^a\w+([0-9]+:fig)?'
apple42:fig
```

For patterns matching from the same starting location, longest match wins in case of BRE/ERE flavors. So, `\w+` will give up characters to allow `([0-9]+:fig)?` to also match in the second case. In other flavors like PCRE, the output would be `apple42` for both the cases.

**15)** For the input file `patterns.txt`, match all lines starting with `[5]`.

```bash
$ grep '^\[5]' patterns.txt
[5]*3
```

**16)** What characters will the pattern `\t` match? A tab character or `\` followed by a `t` or something else? Does the behavior change inside a character class? What alternatives are there to match a tab character?

`\t` will match `t`, however newer versions of `GNU grep` will also issue a warning for undefined escape sequences (and may become an error in future versions).

Within a character class, `\t` represents `\` and `t` as two separate characters.

To match a tab character, it can be specified literally (by pressing `Ctrl+v` followed by the Tab key). You can also use [ANSI-C quoting](https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting) provided by the shell or switch to PCRE using the `-P` option.

**17)** From the input file `patterns.txt`, extract all hexadecimal sequences with a minimum of four characters. Match `0x` as an optional prefix, but shouldn't be counted for determining the length. Match the characters case insensitively, and the sequences shouldn't be surrounded by other word characters.

```bash
# can also use: grep -iowE '(0x)?[[:xdigit:]]{4,}'
$ grep -iowE '(0x)?[0-9a-f]{4,}' patterns.txt
0XdeadBEEF
bad42
0x0ff1ce
```

**18)** From the input file `patterns.txt`, extract from `-` till the end of the line, provided the characters after the hyphen are all word characters only.

```bash
# can also use: grep -o -- '-\w*$'
$ grep -o '\-\w*$' patterns.txt
-handy
-icy
```

**19)** For the input file `patterns.txt`, count the total number of lines containing `e` or `i` followed by `l` or `n` and vice versa.

```bash
$ grep -cE '[ei].*[ln]|[ln].*[ei]' patterns.txt
18
```

**20)** For the input file `patterns.txt`, match lines starting with `4` or `-` or `u` or `sub` or `care`.

```bash
$ grep -E '^([4u-]|sub|care)' patterns.txt
care
4*5]
-handy
subtle sequoia
unhand
```

<br>

# Context matching

**1)** For the input file `sample.txt`, filter lines containing `do` and also display the line that comes after such a matching line.

```bash
$ grep -A1 'do' sample.txt
Just do-it
Believe it
--
Much ado about nothing
He he he
```

**2)** For the input file `sample.txt`, filter lines containing `o` followed by zero or more characters and then `m` or `r`. Also, display the line that comes before such a matching line.

```bash
$ grep -B1 'o.*[mr]' sample.txt
Hello World
--
Hi there
How are you
--
He he he
Adios amigo
```

**3)** Will you get an error if there are no lines to satisfy the context specified? For example, `Hello` matches only the first line of the `sample.txt` file. If you try `grep -B5 'Hello' sample.txt` will you get the first line in the output or an error?

You won't get any error or even a warning if sufficient number of context lines aren't found. For the example in the question, you'll get only the first line of the input file.

**4)** For the input file `sample.txt`, filter lines containing `pay` and also display the line that comes before and after such a matching line.

```bash
# can also use: grep -1 'pay'
$ grep -C1 'pay' sample.txt
banana
papaya
mango
```

**5)** For the input file `sample.txt`, filter lines containing `lie` and also display the line that comes before and two lines after such a matching line.

```bash
$ grep -B1 -A2 'lie' sample.txt
Just do-it
Believe it

banana
```

**6)** Will the `-v` option work as expected when combined with the context based options?

No.

**7)** Under what conditions will the separator `--` be absent even when there are multiple context matches?

The separator won't be added if two or more groups of matching lines:

* have overlapping lines
* are next to each other

**8)** For the input file `sample.txt`, filter lines containing `are` or `he` as whole words as well as the line that comes before such a matching line. There should be no separator between the groups of matching lines in the output.

```bash
$ grep --no-group-separator -B1 -wE 'are|he' sample.txt
Hi there
How are you
Much ado about nothing
He he he
```

**9)** For the input file `sample.txt`, filter lines containing `pay` or `the` as well as the line that comes after/before such a matching line. Show `=====` as the separator between the groups of matching lines in the output.

```bash
$ grep --group-separator='=====' -EC1 'pay|the' sample.txt

Hi there
How are you
=====
banana
papaya
mango
```

**10)** The input file `sample.txt` has an empty line between group of lines. Change it to double empty lines between the groups.

```bash
$ grep --group-separator=$'\n' -A0 '.' sample.txt
Hello World


Hi there
How are you


Just do-it
Believe it


banana
papaya
mango


Much ado about nothing
He he he
Adios amigo
```

<br>

# Recursive search

>![info](../images/info.svg) Use the `recursive.sh` script from the [exercises](https://github.com/learnbyexample/learn_gnugrep_ripgrep/tree/master/exercises) directory for this section. Unless otherwise mentioned, assume you need to use the `-r` option instead of `-R`.
>
> ```bash
> # change to the 'exercises' directory and source the 'recursive.sh' script
> $ source recursive.sh
> 
> $ tree -a
> .
> ├── backups
> │   ├── color list.txt
> │   ├── dot_files
> │   │   ├── .bash_aliases
> │   │   └── .inputrc
> │   └── text
> │       └── pat.txt -> ../../../patterns.txt
> ├── colors_1
> ├── colors_2.txt
> ├── .hidden
> ├── projects
> │   ├── python
> │   │   └── hello.py
> │   └── shell
> │       └── hello.sh
> ├── sample_file.txt -> ../sample.txt
> └── substitute.sh
> 
> 6 directories, 11 files
> ```

**1)** Search recursively and display the lines containing `ello`. Output should not have filename prefix.

```bash
$ grep -rh 'ello'
    print("Hello, Python!")
echo "Hello, Bash!"
yellow
yellow
```

**2)** Search recursively and list the names of files containing `blue` or `on` or a double quote character. Match all of these terms only at the end of a line.

```bash
$ grep -rlE '(blue|on|")$'
projects/shell/hello.sh
colors_1
colors_2.txt
backups/dot_files/.inputrc
backups/color list.txt
```

**3)** Search recursively and list the names of files containing `blue`, but do not search within the `backups` directory.

```bash
$ grep -rl --exclude-dir='backups' 'blue'
.hidden
colors_1
colors_2.txt
```

**4)** Search recursively within the `backups` directory and list the names of files containing `red`. Symbolic links found in this directory should be searched as well.

```bash
$ grep -Rl 'red' backups
backups/color list.txt
backups/text/pat.txt
```

**5)** Search recursively and list the names of files that do *not* contain `greeting` or `blue`. Symbolic links should be searched as well.

```bash
$ grep -RLE 'greeting|blue'
projects/shell/hello.sh
substitute.sh
sample_file.txt
backups/dot_files/.bash_aliases
backups/dot_files/.inputrc
```

**6)** Search for files containing `red` or `ello` recursively, but do not list the file if it also contains `greeting`.

```bash
$ grep -rlEZ 'red|ello' | xargs -r0 grep -L 'greeting'
projects/shell/hello.sh
colors_1
colors_2.txt
```

**7)** Search recursively only within filenames ending with `.txt` and display the names of files containing `red`. Symbolic links should be searched as well.

```bash
# can also use: grep -l 'red' **/*.txt (if globstar is set)
$ grep -Rl --include='*.txt' 'red'
colors_2.txt
backups/color list.txt
backups/text/pat.txt
```

**8)** Search recursively only within filenames ending with `.txt` but not if the name has a space character. Display the names of files containing `red`. Symbolic links should be searched as well.

```bash
# can also use: grep -l 'red' **/*([^ ]).txt (if globstar and extglob are set)
$ grep -Rl --include='*.txt' --exclude='* *' 'red'
colors_2.txt
backups/text/pat.txt
```

**9)** Which option will you use if you have a file with a list of glob patterns to identify filenames to be excluded?

>`--exclude-from=FILE`
>
>Skip files whose base name matches any of the file-name globs read
>from FILE (using wildcard matching as described under `--exclude`).

**10)** Does the glob pattern provided to `include` and `exclude` options match only the basename or the entire file path? Assume that recursive search is active.

Only the basename.

**11)** How would you tell `grep` to avoid treating directory arguments as input files to be searched?

You can use `-d skip`. As per the manual:

>`-d ACTION`, `--directories=ACTION`
>
>If  an  input  file  is  a directory, use ACTION to process it.  By
>default, ACTION is `read`, i.e., read directories  just  as  if  they
>were ordinary files.  If ACTION is `skip`, silently skip directories.
>If  ACTION  is  `recurse`,  read  all  files  under  each  directory,
>recursively,  following  symbolic  links  only  if  they are on the
>command line.  This is equivalent to the `-r` option.

**12)** Use a combination of `find` and `grep` commands to display lines containing a whole word `Hi` only for symbolic links.

```bash
$ find -type l -exec grep -w 'Hi' {} +
./sample_file.txt:Hi there
./backups/text/pat.txt:Hi there(greeting). Nice day(a(b)
```

**13)** Search recursively and list the names of files that contain `Hello` or `blue`. Symbolic links should be searched as well. Do not search within `python` or `backups` directories.

```bash
# can also use: --exclude-dir={python,backups}
$ grep -RlE --exclude-dir='python' --exclude-dir='backups' 'Hello|blue'
projects/shell/hello.sh
.hidden
colors_1
sample_file.txt
colors_2.txt
```

**14)** Search recursively only within filenames ending with `.txt` and count the total number of lines containing `car` or `blue` or a digit character. Symbolic links should be searched as well.

```bash
# can also use: cat **/*.txt | grep -cE 'car|blue|[0-9]'
$ grep -RE --include='*.txt' 'car|blue|[0-9]' | wc -l
21
```

**15)** Display lines containing `Hello` or `red` only from files in the current hierarchy, i.e. don't search recursively. Symbolic links should be searched as well.

```bash
# can also use: find -L -maxdepth 1 -type f -exec grep 'Hello\|red' {} +
$ grep -d skip 'Hello\|red' *
colors_2.txt:red
sample_file.txt:Hello World
```

**16)** Search recursively for files containing `blue` as well as `yellow` anywhere in the file, but do not list the file if it also contains `teal`.

```bash
$ grep -rlZ 'blue' | xargs -r0 grep -lZ 'yellow' | xargs -r0 grep -L 'teal'
colors_2.txt
```

<br>

# Miscellaneous options

**1)** What do the `-q` and `-s` options do?

>`-q`, `--quiet`, `--silent`
>
>Quiet; do not write anything to standard output.  Exit  immediately
>with  zero  status  if  any  match  is  found, even if an error was
>detected.
>
>`-s`, `--no-messages`
>
>Suppress error messages about nonexistent or unreadable files.

**2)** For the input file `sample.txt`, extract from the first occurrence of `Just` to the last occurrence of `it`. These terms can occur across different lines. Perform additional transformation to convert ASCII NUL characters, if any, to the newline character.

```bash
$ grep -oz 'Just.*it' sample.txt | tr '\0' '\n'
Just do-it
Believe it
```

**3)** For the input file `nul_separated`, use the ASCII NUL character as the *line* separator and display lines starting with `a`. Perform additional transformation to convert ASCII NUL characters, if any, to the newline character.

```bash
$ grep -z '^a' nul_separated | tr '\0' '\n'
apple
fig
mango
icecream
```

**4)** Read about the `--line-buffered` option from the manual (read [this link](https://stackoverflow.com/q/7161821/4082052) too) and see it in action with code shown below:

```bash
$ for i in {1..5}; do seq 12; sleep 1; done | grep '[1-489]' | grep -v '0'

# '> ' is secondary prompt (PS2), not part of the command
$ for i in {1..5}; do seq 12; sleep 1; done | \
> grep --line-buffered '[1-489]' | grep -v '0'
```

**5)** Write a Bash script `find_digits.sh` that loops over filenames passed as arguments. For each file, search for the presence of a digit character and display the results in the format shown below.

```bash
$ cat find_digits.sh
for f in "$@"; do
    if grep -q '[0-9]' "$f"; then
        echo "$f: found digit characters"
    else
        echo "$f: digit characters not found"
    fi
done

$ bash find_digits.sh sample.txt patterns.txt regex_terms.txt
sample.txt: digit characters not found
patterns.txt: found digit characters
regex_terms.txt: found digit characters

$ bash find_digits.sh terms.txt lines.txt
terms.txt: found digit characters
lines.txt: digit characters not found
```

**6)** For the input file `sample.txt`, display lines containing `he` prefixed with the byte location of the matching lines.

```bash
$ grep -b 'he' sample.txt
13:Hi there
102:He he he
```

**7)** What does the `--label` option do?

>`--label=LABEL`
>
>Display  input  actually coming from standard input as input coming
>from file LABEL.  This can be useful for commands that transform  a
>file's  contents  before  searching,  e.g.,  `gzip -cd foo.gz | grep
>--label=foo -H 'some pattern'`.  See also the `-H` option.

<br>

# Perl Compatible Regular Expressions

**1)** From the `sample.txt` input file, extract from the start of a line to the first occurrence of `he`.

```bash
$ grep -oP '^.*?he' sample.txt
Hi the
He he
```

**2)** For the input file `terms.txt`, display line that do *not* contain a digit character.

```bash
$ grep -vP '\d' terms.txt
are
not
go
```

**3)** From the `pcre.txt` input file, extract consecutive repeated occurrences of `abc` followed by `a` provided that the final `a` isn't part of `abc`. For example, `abcabcadef` should give `abcabca` as the output and `abcabcabcd` shouldn't match.

```bash
$ grep -oP '(abc)++a' pcre.txt
abcabcabca
```

**4)** What's the syntax for non-capturing group and name a use case for such a grouping.

The syntax is `(?:pattern)` and it helps to avoid keeping a track of groups not needed for backreferencing.

**5)** What is negative backreferencing?

A useful approach when there are numerous capture groups is to use negative backreferences. The negative numbering starts with `-1` to refer to the capture group closest to the backreference that was defined before the backreference. In other words, the highest numbered capture group prior to the backreference will be `-1`, the second highest will be `-2` and so on.

The syntax is `\g{-N}` where `N` is the relevant group number. `{}` is optional if there is no ambiguity.

**6)** What's the difference between backreference and subexpression calls?

If backreferences are like variables, then subexpression calls are like functions. Backreferences allow you to reuse the portion matched by the capture group. Subexpression calls allow you to reuse the pattern that was used inside the capture group. You can call subexpressions recursively too.

The syntax is `(?N)` to refer to that particular capture group by number (relative numbering is allowed as well). Named capture groups can be called in various ways as `(?&name)` or `(?P>name)` or `\g<name>` or `\g'name'`.

**7)** From the `pcre.txt` input file, extract from `S:` followed by a digit character to the very next occurrence of `E:` followed by two or more digits. For example, `S:12 E:5 fig S:4 and E:123` should give `S:4 and E:123` as the output and `S:1 - E:2` shouldn't match.

```bash
$ grep -oP '(?>S:\d+.*?E:)\d{2,}' pcre.txt
S:4 and E:123
S:42 E:43
S:100 & E:10
```

**8)** From the `sample.txt` input file, extract all sequences made up of lowercase letters except those that start with `a` or `h` or `i` or `t`. Such sequences should not be surrounded by other word characters.

```bash
$ grep -woP '(?![ahit])[a-z]+' sample.txt
you
do
banana
papaya
mango
nothing
```

**9)** From the `sample.txt` input file, extract all sequences made up of lowercase letters except those that end with letters from `g` to `z`. Such sequences should not be surrounded by other word characters.

```bash
# can also use: grep -woP '[a-z]+(?<=[a-f])' or grep -wo '[a-z]*[a-f]'
$ grep -woP '[a-z]+(?<![g-z])' sample.txt
there
are
banana
papaya
he
he
```

**10)** From the `pcre.txt` input file, extract integer portion of floating-point numbers. Integers and numbers ending with `.` and no further digits should not be considered. For example, output for `ab32.4` should be `32` and numbers like `2.` and `456` should not be matched.

```bash
$ grep -oP '\d+\.\d+' pcre.txt
32.4
46.42

$ grep -oP '\d+(?=\.\d)' pcre.txt
32
46
```

**11)** For the input file `pcre.txt`, filter lines that satisfy all of these rules:

* at least 2 alphabets
* at least 3 digits
* at least 1 special character among `%` or `*` or `#` or `$`
* should *not* contain `Yz` or `if`

```bash
$ grep -P '^(?=(.*[a-zA-Z]){2})(?=(.*\d){3})(?!.*(if|Yz)).*[%*#$]' pcre.txt
F2H3u#9
A $ C1234
```

**12)** From the `pcre.txt` input file, extract from the second field to the second last field from rows having at least two columns considering `;` as the delimiter. For example, `b;c` should be extracted from `a;b;c;d` and a line containing less than two `;` characters shouldn't produce any output.

```bash
$ grep -oP ';\K.+(?=;)' pcre.txt
in;awe;b2b;3list
be;he;0;a;b
```

**13)** For the input file `pcre.txt`, match lines if it contains `qty` followed by `price` but not if there is any **whitespace** character or the string `error` between them.

```bash
$ grep -P 'qty((?!\s|error).)*price' pcre.txt
23,qty,price,42
(qtyprice) (hi-there)
42\nqty-6,apple-56,price-234,error
```

**14)** From the `pcre.txt` input file, extract `if` followed by content within any number of nested parentheses.

```bash
$ grep -oP 'if(\((?:[^()]++|(?1))++\))' pcre.txt
if(3-(k*3+4)/12-(r+2/3))
if(a(b)c(d(e(f)1)2)3)
```

**15)** What does the `\G` anchor do?

The `\G` anchor matches the start of the input string, just like the `\A` anchor. In addition, it will also match at the end of the previous match. This helps you to mark a particular location in the input string and continue from there instead of having the pattern to always check for the specific location.

**16)** From the `patterns.txt` input file, extract from `car` at the start of a line to the very next occurrence of `book` or `lie` in the file. Perform additional transformation to convert ASCII NUL characters, if any, to the newline character.

```bash
$ grep -zoP '(?ms)^car.*?(book|lie)' patterns.txt | tr '\0' '\n'
care
4*5]
a huge discarded pile of book
car
eden
rested replie
```

**17)** For the input file `patterns.txt`, match lines having the content present in the `p` shell variable literally at the end of lines. For example, if `p='*[5]'`, then `(9-2)*[5]` would be a valid match, but not `[4]*[5]+[6]`.

```bash
$ p='*[5]'
$ grep -P '\Q'"$p"'\E$' patterns.txt
(9-2)*[5]

$ p='*4)'
$ grep -P '\Q'"$p"'\E$' patterns.txt
12- (e+(j/k-3)*4)

$ p='42'
$ grep -P '\Q'"$p"'\E$' patterns.txt
Hi42Bye nice1423 bad42
```

**18)** From the `patterns.txt` input file, extract all whole words if a line also contains `car`. But, any word occupying the first five characters in the line shouldn't be part of the output. For example, `no scar` shouldn't produce any output since both words have all/some characters within the first five characters in the line. `part cart mart` should produce `cart` and `mart` as output. `two sets tests` would fail the `car` condition, and thus shouldn't produce any output.

```bash
$ grep 'car' patterns.txt
scar
par car tar far Cart
care
a huge discarded pile of books
scare
car
part cart mart

$ grep 'car' patterns.txt | grep -woP '^.{1,5}(*SKIP)(*F)|\w+'
tar
far
Cart
discarded
pile
of
books
cart
mart
```

**19)** What do the following unicode character sets match?

* `\p{L}` — any letter
* `\P{L}` — other than letters, can also use `\p{^L}`
* `\p{Greek}` — Greek letters
* `\p{Xwd}` — word characters
* `\p{P}` — punctuation characters

**20)** What do the following escape sequences do?

* `\A` — restricts the match to the start of string
* `\z` — restricts the match to the end of string
* `\Z` — similar to `\z` but if newline is the last character, `\Z` will also match just before this newline character

<br>

# ripgrep

Would be a good idea to first redo all the exercises using `rg` from all the previous chapters. Some exercises will require reading the manual, as those options aren't covered in this book.

**1)** Which option will change the line separator from `\n` to `\r\n`?

```bash
# no output
$ rg -cx '' dos.txt

$ rg --crlf -cx '' dos.txt
4
```

>`--crlf`
>
>When enabled, ripgrep will treat CRLF (`\r\n`) as a line terminator
>instead of just `\n`

**2)** Default behavior of `ripgrep` changes depending on whether the output is redirected or not. Use appropriate option(s) to filter lines containing `are` from the `sample.txt` and `patterns.txt` input files and pipe the output to `tr 'a-z' 'A-Z'` to get results as shown below.

```bash
$ rg -n --heading 'are' sample.txt patterns.txt | tr 'a-z' 'A-Z'
PATTERNS.TXT
12:CARE
15:SCARE

SAMPLE.TXT
4:HOW ARE YOU
```

**3)** Replace all occurrences of `].*[` with `_` for the input file `regex_terms.txt`.

```bash
$ rg --passthru -NF '].*[' -r '_' regex_terms.txt
^[c-k].*\W$
ly.
[A-Z_0-9]
```

**4)** For the input file `nul_separated`, use the ASCII NUL character as the *line* separator and display lines containing `fig`. Perform additional transformation to convert ASCII NUL characters, if any, to the newline character.

```bash
$ rg --null-data 'fig' nul_separated | tr '\0' '\n'
apple
fig
mango
icecream
```

**5)** For the input file `nul_separated`, replace the ASCII NUL character with a newline character, followed by `---` and another newline character.

```bash
$ rg -aN --passthru '\x00' -r $'\n---\n' nul_separated
apple
fig
mango
icecream
---
how are you
have a nice day
---
dragon unicorn centaur
```

**6)** Extract all whole words from the `sample.txt` input file. However, do not extract words if they contain any character present in the `ignore` shell variable.

```bash
$ ignore='aety'
# can also use: rg -No '\w+' sample.txt | rg -v "[$ignore]"
$ rg -No '\b[\w--['"$ignore"']]+\b' sample.txt
World
Hi
How
do
Much
Adios

$ ignore='eosW'
$ rg -No '\b[\w--['"$ignore"']]+\b' sample.txt
Hi
it
it
banana
papaya
Much
```

**7)** How would you represent a `$` character literally when using the `-r` option?

`$$`

**8)** From the `patterns.txt` input file, extract from `car` at the start of a line to the very next occurrence of `book` or `lie` in the file.

```bash
$ rg -NUo '(?s)^car.*?(book|lie)' patterns.txt
care
4*5]
a huge discarded pile of book
car
eden
rested replie
```

**9)** From the `pcre.txt` input file, extract from the second field to the second last field from rows having at least two columns considering `;` as the delimiter. For example, `b;c` should be extracted from `a;b;c;d` and a line containing less than two `;` characters shouldn't produce any output.

```bash
# can also use: rg -oNP ';\K.+(?=;)' pcre.txt
$ rg -oN ';(.+);' -r '$1' pcre.txt
in;awe;b2b;3list
be;he;0;a;b
```

**10)** For the input file `python.md`, match all lines containing `python` irrespective of case, but not if it is part of code blocks that are bounded by triple backticks.

```bash
$ rg -iNPU '(?s)^```.*?^```(*SKIP)(*F)|python' python.md
REPL is a good way to learn PYTHON for beginners.
python comes loaded with awesome methods. Enjoy learning pYtHoN.
```

>![info](../images/info.svg) For the rest of the exercises, use the `recursive_matching` directory that was created in an earlier chapter. Source the `recursive.sh` script if you haven't created this directory yet.
>
> ```bash
> # the 'recursive.sh' script is present in the 'exercises' directory
> $ source recursive.sh
> ```

**11)** List all files not containing `blue`. Hidden files should also be considered.

```bash
$ rg --hidden --files-without-match 'blue'
substitute.sh
backups/dot_files/.bash_aliases
backups/dot_files/.inputrc
projects/shell/hello.sh
projects/python/hello.py
```

**12)** List all the files in the `backups` directory, including links and hidden files.

```bash
$ rg -L --hidden --files backups/
backups/text/pat.txt
backups/color list.txt
backups/dot_files/.inputrc
backups/dot_files/.bash_aliases
```

**13)** What does the `-uuu` option mean?

* `-u` indicates `--no-ignore`
* `-uu` indicates `--no-ignore --hidden`
* `-uuu` indicates `--no-ignore --hidden --binary`

With `rg -uuu` you can match the default behavior of the `grep -r` command.

**14)** Display lines containing a word ending with `e`. Search only among the `sh` file type and the output should not have line number or filename prefixes.

```bash
$ rg -NI -t 'sh' 'e\b'
sed -i 's/search/replace/g' **/*.txt
```

**15)** List files other than hidden files and file types `sh` and `py`. Links should be considered for listing.

```bash
$ rg -L -T 'sh' -T 'py' --files
backups/text/pat.txt
backups/color list.txt
colors_2.txt
sample_file.txt
colors_1
```

**16)** List all files not containing a `.` character in their names. Ignore links.

```bash
$ rg -g '!*.*' --files
colors_1
```

**17)** What does `**` mean when used with the `-g` option?

The `**` pattern serves as a placeholder for zero or more levels of directories. See [git documentation: gitignore pattern format](https://git-scm.com/docs/gitignore#_pattern_format) for more details.

**18)** Search recursively and list the names of files that contain `Hello` or `blue`. Symbolic links should be searched as well. Do not search within `python` or `backups` directories.

```bash
$ rg -lL -g '!{python,backups}' 'Hello|blue'
colors_2.txt
sample_file.txt
colors_1
projects/shell/hello.sh
```

**19)** Match lines containing `Hello` or `red` only from files in the current hierarchy, i.e. don't search recursively. Symbolic links should be searched as well.

```bash
# can also use: rg -Lg '!*/' 'Hello|red'
$ rg -L --max-depth 1 'Hello|red'
colors_2.txt
5:red

sample_file.txt
1:Hello World
```

**20)** Search recursively for files containing `blue`, `yellow` and `teal` anywhere in the file.

```bash
$ rg -l0 'blue' | xargs -r0 rg -l0 'yellow' | xargs -r0 rg -l 'teal'
colors_1
```

