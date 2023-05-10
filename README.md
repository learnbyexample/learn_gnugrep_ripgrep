# CLI text processing with GNU grep and ripgrep

Example based guide to mastering GNU grep and ripgrep. Visit https://youtu.be/MSbGokwHm-A for a short video about the book.

<p align="center"><img src="./images/grep_ls.png" alt="CLI text processing with GNU grep and ripgrep ebook cover image" /></p>

The book also includes exercises to test your understanding, which are presented together as a single file in this repo — [Exercises.md](./exercises/Exercises.md)

For solutions to the exercises, see [Exercise_solutions.md](./exercises/Exercise_solutions.md).

You can also use [this interactive TUI app](https://github.com/learnbyexample/TUI-apps/blob/main/GrepExercises) to practice some of the exercises from the book.

See [Version_changes.md](./Version_changes.md) to keep track of changes made to the book.

<br>

# E-book

* You can purchase the pdf/epub versions of the book using these links:
    * https://learnbyexample.gumroad.com/l/gnugrep_ripgrep
    * https://leanpub.com/gnugrep_ripgrep
* You can also get the book as part of these bundles:
    * **All books bundle** bundle from https://learnbyexample.gumroad.com/l/all-books
        * Includes all my programming books
    * **Magical one-liners** bundle from https://learnbyexample.gumroad.com/l/oneliners or https://leanpub.com/b/oneliners
    * **Awesome Regex** bundle from https://learnbyexample.gumroad.com/l/regex or https://leanpub.com/b/regex
* See https://learnbyexample.github.io/books/ for a list of other books

For a preview of the book, see [sample chapters](./sample_chapters/gnu_grep_sample.pdf).

The book can also be [viewed as a single markdown file in this repo](./gnu_grep.md). See my blogpost on [generating pdfs from markdown using pandoc](https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/) if you are interested in the ebook creation process.

For the web version of the book, visit https://learnbyexample.github.io/learn_gnugrep_ripgrep/

<br>

# Feedback and Contributing

⚠️ ⚠️ Please DO NOT submit pull requests. Main reason being any modification requires changes in multiple places.

I would highly appreciate if you'd let me know how you felt about this book. It could be anything from a simple thank you, pointing out a typo, mistakes in code snippets, which aspects of the book worked for you (or didn't!) and so on. Reader feedback is essential and especially so for self-published authors.

You can reach me via:

* Issue Manager: [https://github.com/learnbyexample/learn_gnugrep_ripgrep/issues](https://github.com/learnbyexample/learn_gnugrep_ripgrep/issues)
* E-mail: `echo 'bGVhcm5ieWV4YW1wbGUubmV0QGdtYWlsLmNvbQo=' | base64 --decode`
* Twitter: [https://twitter.com/learn_byexample](https://twitter.com/learn_byexample)

<br>

# Table of Contents

1) Preface
2) Introduction
3) Frequently used options
4) BRE/ERE Regular Expressions
5) Context matching
6) Recursive search
7) Miscellaneous options
8) Perl Compatible Regular Expressions
9) Gotchas and Tricks
10) ripgrep
11) Further Reading

<br>

# Acknowledgements

* [GNU grep documentation](https://www.gnu.org/software/grep/manual/grep.html) — manual and examples
* [ripgrep](https://github.com/BurntSushi/ripgrep) — user guide and examples
* [stackoverflow](https://stackoverflow.com/) and [unix.stackexchange](https://unix.stackexchange.com/) — for getting answers to pertinent questions on `grep` and related commands
* [tex.stackexchange](https://tex.stackexchange.com/) — for help on [pandoc](https://github.com/jgm/pandoc/) and `tex` related questions
* [/r/commandline/](https://old.reddit.com/r/commandline), [/r/linux4noobs/](https://old.reddit.com/r/linux4noobs/), [/r/linuxquestions/](https://old.reddit.com/r/linuxquestions/) and [/r/linux/](https://old.reddit.com/r/linux/) — helpful forums
* [canva](https://www.canva.com/) — cover image
* [oxipng](https://github.com/shssoichiro/oxipng), [pngquant](https://pngquant.org/) and [svgcleaner](https://github.com/RazrFalcon/svgcleaner) — optimizing images
* [Warning](https://commons.wikimedia.org/wiki/File:Warning_icon.svg) and [Info](https://commons.wikimedia.org/wiki/File:Info_icon_002.svg) icons by [Amada44](https://commons.wikimedia.org/wiki/User:Amada44) under public domain
* [carbon](https://carbon.now.sh/) — creating terminal screenshots with highlighted text
* [Andrew Gallant](https://blog.burntsushi.net/about/) (author of `ripgrep`), [mikeblas](https://old.reddit.com/user/mikeblas) and [Pound-Hash](https://github.com/Pound-Hash) for critical feedback
* [mdBook](https://github.com/rust-lang/mdBook) — for web version of the book
    * [mdBook-pagetoc](https://github.com/JorelAli/mdBook-pagetoc) — for adding table of contents for each chapter
    * [minify-html](https://github.com/wilsonzlin/minify-html) — for minifying html files

Special thanks to all my friends and online acquaintances for their help, support and encouragement, especially during difficult times.

<br>

# License

The book is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

The code snippets are licensed under MIT, see [LICENSE](./LICENSE) file.

