#!/bin/bash
version=$(curl --silent "https://api.steamcmd.net/v1/info/380870" | jq '.data."380870".depots.branches.public.buildid' -r)
currentversion=$(cat currentversion)
echo "currentversion:$currentversion version:$version"
echo "$version" > currentversion
if [[ "$currentversion" == "$version" ]]; then
    exit
fi
git config user.name github-actions
git config user.email github-actions@github.com
git add currentversion
git commit -a -m "Auto Update Project Zomboid to buildid: $version"
git tag -f latest
git push
git push origin --tags -f