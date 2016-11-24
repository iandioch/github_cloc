A quick script to let you get a `cloc` of all of your repositories on Github.

Requirements:

- cloc
- fish
- python2
- git (ofc)

You will need a Github API auth token, put in a file called `auth_token.priv`. You will also need to change the variable `GITHUB_USER` in `run.fish` from `iandioch` to your own handle.

Once you're ready, just run `./run.fish`.
