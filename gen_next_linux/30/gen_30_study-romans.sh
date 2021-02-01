#!/bin/bash
#### date command: Linux

#### Post and date specific variables
title="Study: "
subject="Bible Study on Romans"
url_subject="study-romans"
subject_dir=0-study-romans
Category="Bible Study"
Tag="Romans"
Series="Bible Study: Romans"
time="T06:00:00-06:00"

#### Common variables
bin_dir=$HOME/bin
posts_dir=$HOME/Sites/theologic.us/content/posts/$subject_dir
# posts_dir=$HOME/Temp/$subject_dir

# mkdir working directory if there is none
mkdir -p "$posts_dir"

# Clear current weeks
weeks=$bin_dir/weeks
true > $weeks

echo "Last entry for $subject: "
echo "$(ls -1 $posts_dir | grep md | tail -n1)"

# Set the prompt for the select command
echo "Setting up posts for $subject: "
PS3="Select a date or "q" to quit: "

# Give me the next 30 days to choose from
for i in {0..30}; do
  echo "$(date -d "next $dow $i days" +%F)" >> $weeks
done

listofdates=$(cat $weeks)

# Show a menu and ask for input.
select selectdate in $listofdates; do
    if [ -n "$selectdate" ]; then
        echo ${selectdate}
    fi
    break
done

echo "Publishing "$subject" starting on "$selectdate"!"

read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	for j in {0..30}; do
	  postdate=$(date -d "$selectdate $j days" +%F)
    cat << EOF > "$posts_dir"/"$postdate"-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time
url: /$url_subject/$postdate-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
draft: true
---
## The Text

## The Support

## Our God

## The Gospel

## Our Responsibility

EOF
  done
fi
