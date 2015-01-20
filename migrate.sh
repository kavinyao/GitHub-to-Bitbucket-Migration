#!/bin/bash

# a file containing your github repos (case-sensitive)
# put each repo on its own line
REPO_FILE=repos
# your github username
GH_USER=kavinyao
# your bitbucket username
BB_USER=kavinyao
# preferred remote name for bitbucket
REMOTE=bitbucket

if [ ! -f $REPO_FILE ]; then
    echo "file $REPO_FILE not found in $PWD!"
    exit 1
fi

for repo in $(cat $REPO_FILE); do
    github="https://github.com/$GH_USER/$repo.git"
    # NOTE: bitbucket's repo name is case-insensitive
    bitbucket="https://$BB_USER@bitbucket.org/$BB_USER/$(echo $repo | tr '[:upper:]' '[:lower:]').git"

    # clone github repo
    git clone $github
    # enter directory
    cd $repo
    # fetch everything
    # TODO: checkout remote branches
    git fetch
    git fetch --tags
    # add bitbucket as remote
    git remote add $REMOTE $bitbucket
    # and push everything to it
    git push -u $REMOTE --all
    git push -u $REMOTE --tags
    # exit directory and delte it
    cd ..
    rm -rf $repo
    # print an empty line as separator
    echo
done

