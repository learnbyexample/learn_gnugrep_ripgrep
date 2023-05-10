dir_name='recursive_matching'
if [[ -e "$dir_name" ]] ; then
    cd "$dir_name"
    return
fi

mkdir "$dir_name" && cd $_

mkdir -p backups/{text,dot_files} projects/{python,shell}

printf 'teal\nlight blue\nbrown\nyellow\n' > colors_1
printf 'blue\nblack\ndark green\nyellow\nred\n' > colors_2.txt
printf 'ghost\nclear blue sky\n' > .hidden
echo "sed -i 's/search/replace/g' **/*.txt" > substitute.sh

cat << 'EOF' > projects/python/hello.py
def greeting():
    print("Hello, Python!")

greeting()
EOF
echo 'echo "Hello, Bash!"' > projects/shell/hello.sh

printf 'alias p=pwd\nalias c=clear\n' > backups/dot_files/.bash_aliases
echo 'set completion-ignore-case on' > backups/dot_files/.inputrc
printf 'red\ngreen\nblue\n' > 'backups/color list.txt'

ln -s ../../../patterns.txt backups/text/pat.txt
ln -s ../sample.txt sample_file.txt
