#!/bin/sh -x

# Fetch the name of the current branch
cb=$(git branch --show-current)

if [ -z $cb ]; then
    echo no branch
    exit 1
fi

# List all open pull requests
op=$(gh pr list --state open --search draft:false --json number -q '.[].number')

rev=""
for pr in $op
do 
    rev="$pr $rev"
done

    # Loop over each open PR
for pr in $rev
do
  # Checkout to the PR branch
  gh pr checkout $pr || exit 1
  git pull || exit 1
  # Switch back to the original branch
  git checkout $cb

  echo Merging $pr into master/main
  
  # Merge the PR branch
  git merge --no-ff --no-edit FETCH_HEAD || exit 1
done

### Push the changes to the remote repository
## echo git push origin $cb

