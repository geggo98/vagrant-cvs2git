#! /bin/bash
set -euo pipefail 
IFS=$'\n\t'

#Adapt there variables to your needs
src=cvs
target=./project.git
encoding=latin1

echo "Create working directory"
tmp=$(mktemp --directory)
echo "Working directoty: ${tmp}"

echo "Gather CVS data"
cvs2git --tmpdir=${tmp} --blobfile=${tmp}/git-blob.dat --dumpfile=${tmp}/git-dump.dat --fallback-encoding=${encoding} "${src}"

echo "Create git repository ${target}"
mkdir -p "${target}"
git init --bare "${target}"
 
pushd .
cd "${target}"

echo "Importing CVS data in git repository"
pv ${tmp}/git-blob.dat ${tmp}/git-dump.dat | git fast-import

echo "Remove fixup branch"
git branch -D TAG.FIXUP || true

echo "Remove refs"
~/cvs2svn-trunk/contrib/git-move-refs.py

echo "Compacting git repository"
git gc --prune=now
popd

echo "Done (Success)"

