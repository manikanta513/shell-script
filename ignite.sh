#!/bin/bash
#This is scipt to provision patch
#This scrips expects patch_files.tar.gz and patch_provision.sh script file
#The patch_provision.sh will extract patch_files in fusion home and do some required actions

FUSION_VERSION="3.1.3"
FUSION_HOME="/opt/lucidworks/fusion"
cd "${FUSION_HOME}/${FUSION_VERSION}"

echo "Patching Started!"

tar xvf patch_files.tar
#rm patch_files.tar

echo "untar completed, starting to delete old jars"

oldjars=$(find apps/libs  -name \*ignite\* -print | grep 1.7.0 | cut -d "/" -f3)
for f in  apps/libs apps/spark/lib apps/jetty/ui/webapps/root/WEB-INF/lib
do
  for jar in $oldjars
  do
    rm  $f/$jar
  done
done

echo "delete old jars completed, starting with classpath updates"

for jar in $oldjars
do
  p1=$(echo $jar | cut -d "-" -f1)
  p2=$(echo $jar | cut -d "-" -f2)
  newjar=$(echo $jar |sed 's/1.7.0/2.3.0/')
  prefix="$p1\-$p2"
  sed -i 's/'$prefix'.*$/'$newjar'/g' ${FUSION_HOME}/${FUSION_VERSION}/apps/jetty/api/webapps/api-extra-classpath.txt
  sed -i 's/'$prefix'.*$/'$newjar'/g' ${FUSION_HOME}/${FUSION_VERSION}/apps/jetty/connectors/webapps/connectors-extra-classpath.txt
done

echo "Patching Completed!"
~
