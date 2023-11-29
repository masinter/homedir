#!/bin/sh

# given file!nnn, change mv file!n file.~n~ and, if n is the highest
# existing version then link file to file.~n~

# call like with this
# find . -type f -name \*\![1-9]\* -exec rename-parc.sh {} \;

file="$1"
mvcmd="mv"
rmcmd="rm"
lncmd="ln"

# split original filename into name and number
dest=`echo $1 | sed 's/^\(.*\)!\([1-9][0-9]*\)$/\1/'`
vers=`echo $1 | sed 's/^\(.*\)!\([1-9][0-9]*\)$/\2/'`

# target for this rename
vdest="${dest}.~${vers}~"

echo "[[PROCESSING ${file} to ${dest} version ${vers} ]]"
# if a single version 1 then leave unadorned

if [ ! -f "$dest" ]; then
    # no other versions already done. Do this one
    if [ "$vers" -eq 1 ]; then
	$mvcmd "$file" "$dest"
	echo "[[MOVED $file to $dest]]"
	exit 0
    fi
    ${mvcmd} "$file" "$vdest"
    ${lncmd} "$vdest" "$dest"
    echo "[[MOVED $file to $vdest LINKED TO $dest]]"
    exit 0
fi

# There is one already done. See if the new one is bigger than the max
# find maximum version already moved
max=0
for vf in "$dest".~[1-9]*~
do vn=`echo $vf | sed -e 's/^.*\.~\([1-9][0-9]*\)~$/\1/'`
   if [ -f $dest.~$vn~ ]; then
       if [ $max -lt $vn ]; then
	   max=$vn
       fi
   fi
done

if [ $max -eq 0 ]; then
    echo "<<< [[NO OTHER VERSIONS OF $dest ]]"
    exit 1
fi
    
if [ $max -eq $vers ]; then
    echo "[[*** ALREADY MOVED  $dest]]"
    exit 1
fi

${mvcmd} $file $vdest
echo "FILE $file moved to $dest"

if [ $max -lt $vers ]; then
   ${rmcmd} $dest
   ${lncmd} ${dest}.~${vers}~ $dest
fi
echo "FILE $!!!! (newer version)"
