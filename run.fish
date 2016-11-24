#!/usr/bin/fish

set GITHUB_USER iandioch
set ACCESS_TOKEN (cat access_token.priv)
mkdir tmp
cd tmp
curl -s "https://api.github.com/users/iandioch/repos?access_token=$ACCESS_TOKEN" | python2 -c "
import json, sys

inlines = sys.stdin.read()
j = json.loads(inlines)
for repo in j:
	if repo['owner']['login'] == '$GITHUB_USER' and not repo['fork']:
		print repo['clone_url']" > repos.out

xargs -n 1 git clone < repos.out
cloc ./ > ../results.out
cd ..
rm -rf tmp
cat results.out
