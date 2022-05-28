#!/bin/bash

# if [ $(command -v heif-convert) -eq 1 ]; do
  # echo "heif-convert not found";
  # echo "Install with apt get libheif-examples";
  # exit 1;
# done

for fn in `ls *.HEIC`; do 
  echo "Convert $fn"; 
  filename=$(basename $fn .HEIC)
  heif-convert $fn $filename.jpg
  rm $fn
done
