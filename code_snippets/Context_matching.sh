cat context.txt

## -A

grep -A2 'blue' context.txt

grep -x -A2 'blue' context.txt

## -B

grep -B2 'bread' context.txt

grep -B3 'ruby' context.txt

## -C

grep -C1 'sky' context.txt

grep -A1 -B2 'sky' context.txt

grep -C2 'kotlin' context.txt

## Contiguous matches

grep -n -C1 'flower' context.txt

grep -n -A4 'blue' context.txt

## Customizing separators

seq 29 | grep --group-separator='*****' -A1 '3'

grep -A0 --group-separator='*-----------*-----------*' 'in' context.txt

seq 29 | grep --no-group-separator -A1 '3'

seq 29 | grep --no-group-separator -A1 '3' | datamash sum 1

