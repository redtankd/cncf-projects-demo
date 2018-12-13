#!/bin/bash

file=${1-images.properties}

if [ -f "$file" ]
then
  echo "$file found."
  echo 

  while IFS='=' read -r origin mirror version
  do
  	origin=`echo $origin | tr -d " "`
  	mirror=`echo $mirror | tr -d " "`
  	version=`echo $version | tr -d " "`
    echo "original image: ${origin}, mirror image: ${mirror}, version: ${version}"

    echo "FROM ${origin}:${version}" | docker build -t ${mirror}:${version} -
    docker push ${mirror}:${version}
  done < "$file"

else
  echo "$file not found."
fi