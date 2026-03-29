#!/bin/bash

echo "Kernel Name : $(uname -s)"
echo "Kernel Release: $(uname -r)"
echo "Processor Type: $(uname -p)"
echo "Operating System: $(uname -o)"

editor=nano
#  editor name
echo "Favorite Editor: $editor"

#location of editor
echo "Editor Location: $(which $editor)"

# documentation location
echo "Editor Documentation: $(whereis $editor)"
