version=

if [ -f update_processing.sh ]
then
	rm update_processing.sh
fi

echo "Current NSB app version:"
cat version.properties

echo -n "Enter version number: "
read version
echo "$version" > version.properties
echo "let nsbVersion = $version;" > js/version.js

#echo "git add js/version.js" >> update_processing.sh
echo "git commit -a -m 'Bumped version to v$version'" >> update_processing.sh
echo "git tag -a v$version -m 'Bumped version to v$version'" >> update_processing.sh
echo "git push" >> update_processing.sh

chmod +x update_processing.sh
./update_processing.sh

