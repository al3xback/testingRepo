#!/bin/bash

echo "Syncing main branch with develop..."
echo "Checking out to main branch..."
git checkout main

echo "Pulling updates from remote main branch..."
git pull origin main

echo "Pulling changes from remote develop branch..."
git pull origin develop

echo "Pushing changes to main branch..."
git push origin main

echo "Current version is: "
cat version.properties

echo "Please insert the new version: "
read version

echo $version > version.properties

echo "Bumping to version $version..."
git commit -am "Bumped version to v$version"

echo "Tagging version to $version..."
git tag -a v$version -m "Bumped version to v$version"

echo "Pushing changes into main branch..."
git push origin main

echo "Switching to staging branch..."
git checkout staging

echo "Pulling updates from staging branch..."
git pull origin staging

echo "Pulling updates from main branch..."
git pull origin main

echo "Pushing changes into staging branch..."
git push origin staging

echo "Update successfull, checking out to develop branch.."
git checkout develop

echo "Done!"






