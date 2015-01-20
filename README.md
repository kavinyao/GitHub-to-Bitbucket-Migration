# GitHub to Bitbucket Migration Script

This script helps you migrate your GitHub repos to Bitbucket.

To use it, you need to:

1. MANUALLY create empty repos of the same name on Bitbucket
2. create a file containing the repo names, one repo each line
3. in `migrate.sh`, change `GH_USER` and `BB_USER` to your usernames on GitHub and Bitbucket respectively
4. run `./migrate.sh`

**Caveat**: only the master the branch is synced to Bitbucket.

## TODO

- push all branches to Bitbucket
- use API to create repos on Bitbucket
