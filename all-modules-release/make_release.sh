#!/bin/bash

if [ "x$1" == "x" ]
then
  echo Usage: make_release.sh new_version
  exit 1
fi

new_version=$1

PREVIOUS_VERSION=$(grep "<version>" ../wlan-cloud-root/pom.xml |head -2|tail -1|cut -d '>' -f2|cut -d '<' -f 1)
echo "Updating TIP pom.xml files from $PREVIOUS_VERSION to version $new_version "

# update versions on TIP modules using special all-modules-release  
mvn  --batch-mode release:update-versions -DdevelopmentVersion="$new_version" -DautoVersionSubmodules=true


# update version that are not automatically updated
sed -i '' "s/<tip-wlan-cloud.release.version>$PREVIOUS_VERSION<\/tip-wlan-cloud.release.version>/<tip-wlan-cloud.release.version>$new_version<\/tip-wlan-cloud.release.version>/g" ../wlan-cloud-root/pom.xml

#update protobuff dependency under opensync-ext-interface
sed -i '' "s/<version>$PREVIOUS_VERSION<\/version>/<version>$new_version<\/version>/g" ../wlan-cloud-opensync-controller/opensync-ext-interface/pom.xml

echo "Updated TIP pom.xml files to version $new_version"

