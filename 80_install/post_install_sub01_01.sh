#!/bin/bash

set -x

echo "START\n"

#file=$1

#mv ${file} ${file}.org
#php /tmp/get_file.php ${file} $(sha512sum ${file}.org | awk '{print $1}')
#if [ $? -ne 0 ]; then
#  mv ${file}.org ${file}
#fi

echo "$@"

for file in "$@"; do
  mv ${file} ${file}.org
  php /tmp/get_file.php ${file} $(sha512sum ${file}.org | awk '{print $1}')
  if [ $? -ne 0 ]; then
    mv ${file}.org ${file}
  fi
done

echo "FINISH\n"
