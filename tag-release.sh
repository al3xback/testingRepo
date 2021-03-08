#!/bin/bash

echo "Syncing main branch with develop ******************************************\n"
echo "Checking out to main branch ***********************************************\n"
git checkout main

echo "Pulling updates from remote main branch ***********************************\n"
git pull origin main

echo "Pulling changes from remote develop branch ********************************\n"
git pull origin develop

echo "Pushing changes to main branch ********************************************\n"
git push origin main

echo "Current version is: "
cat version.properties

echo "Please insert the new version: "
read version

echo $version > version.properties

echo "Bumping to version $version ***********************************************\n"
git commit -a -m "Bumped version to v$version"

echo "Pushing version commit to main branch ..........${normal}"
git push origin main

echo "Tagging version to $version ***********************************************\n"
git tag -a v$version -m "Bumped version to v$version"

echo "Pushing changes into main branch ******************************************\n"
git push origin v$version

echo "Switching to staging branch ***********************************************\n"
git checkout staging

echo "Pulling updates from staging branch ***************************************\n"
git pull origin staging

echo "Pulling updates from main branch ******************************************\n"
git pull origin main

echo "Pushing changes into staging branch ***************************************\n"
git push origin staging

echo "Update successfull, checking out to develop branch ************************\n"
git checkout develop

echo "Done!"






