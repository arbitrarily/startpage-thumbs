# startpage-thumbs
resize &amp; rename images in bulk with ffmpeg

*Script for renaming files:**

This script is used to rename all .jpg files in the current directory by numbering them in a sequence. Here's a breakdown of what it does:

- `a=1`: This initializes a counter variable `a` to 1.

- `for i in *.jpg; do`: This starts a loop that iterates over every .jpg file in the current directory.

- `new=$(printf "%04d.jpg" "$a")`: This line creates a new filename for each image. The `printf "%04d.jpg" "$a"` part formats the number stored in `a` as a four-digit number, padding it with zeros if necessary.

- `mv -i -- "$i" "$new"`: This moves (or renames) the current file to the new filename. The `-i` option makes `mv` ask for confirmation if a file is going to be overwritten.

- `let a=a+1`: This increments the counter `a` by 1.

- `done`: This ends the loop.

2. **Script for resizing images:**

This script uses the `ffmpeg` tool to resize all .jpg images in the current directory. Here's what it does:

- `for file in *.jpg; do`: This starts a loop that iterates over every .jpg file in the current directory.

- `ffmpeg -i "$file" -vf "scale=-1:240" -q:v 1 "resized_$file"`: This uses `ffmpeg` to resize the current image. The `-i "$file"` part specifies the input file, the `-vf "scale=-1:240"` part sets the output height to 240 pixels and scales the width to maintain the aspect ratio, and the `-q:v 1` part sets the output quality (1 is the highest quality). The `"resized_$file"` part specifies the output file name.

- `done`: This ends the loop.