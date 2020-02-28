#!/bin/bash

sed -i~ "/<servers>/ a\
<server>\
  <id>io.cloudrepo</id>\
  <username>${CLOUDREPO_USERNAME}</username>\
  <password>${CLOUDREPO_PASSPHRASE}</password>\
</server>" /usr/share/maven/conf/settings.xml

