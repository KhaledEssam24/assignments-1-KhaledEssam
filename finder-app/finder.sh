#!/bin/sh

if ["$#" -ne 2];then
    echo "Error: Please provide both the directory path and the search string."
    exit 1
fi

filesdir="$1"
searchstr="$2"

#if [! -d "$filesdir"];then
#  echo "Error: '$filesdir' is not a directory."
#  exit 1
#fi

# Perform the search and count the results
matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)
num_files=$(find "$filesdir" -type f | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $matching_lines"


