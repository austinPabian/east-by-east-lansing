#1/bin/bash

cd -- "$(dirname "$BASH_SOURCE")"

rm -rf .git

touch .static

echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit add -A && git commit -m \"Casey smells like lamprey farts.\" && git push github master" > sync.command
echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit push -f live master" > deploy_live.command
echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit push -f beta master" > deploy_beta.command

chmod +x sync.command deploy_live.command deploy_beta.command

git init
git add -A
git commit -m ":tada: Initial commit"

git remote add github git@github.com:austinPabian/east-by-east-lansing
git remote add live dokku@helios.caseywebb.xyz:exelmusicfest.com
git remote add beta dokku@helios.caseywebb.xyz:beta.exelmusicfest.com

git push -f github master

open deploy_live.command
open deploy_beta.command