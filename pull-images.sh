#!/bin/bash

# the path to images' list, whose last line must be a blank line.
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
    echo

    docker pull ${mirror}:${version}
    docker tag ${mirror}:${version} ${origin}:${version}
    docker rmi ${mirror}:${version}

    echo
  done < "$file"

else
  echo "$file not found."
fi