#!/bin/bash

# Loop through all image files in the directory
for file in *.jpg; do
    # Resize and compress each image
    ffmpeg -i "$file" -vf "scale=-1:240" -q:v 1 "resized_$file"

done
