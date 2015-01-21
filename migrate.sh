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
    # use --mirror option to clone every reference
    # Reference: http://stackoverflow.com/a/22907155/1240620
    git clone --mirror $github
    # enter directory
    cd $repo.git
    # add bitbucket as remote
    git remote add $REMOTE $bitbucket
    # and push everything to it
    git push --mirror $REMOTE
    # exit directory and delte it
    cd ..
    rm -rf $repo.git
    # print an empty line as separator
    echo
done

