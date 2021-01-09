#!/bin/bash
#### date command: Linux

#### Common variables
bin_dir=$HOME/bin
posts_dir=$HOME/Sites/theologic.us/content/posts/$subject_dir
# posts_dir=$HOME/Temp/$subject_dir

#### Post and date specific variables
title="Study: Romans "
subject="Bible Study on Romans"
url_subject="study-romans"
subject_dir=study-romans
Category="Bible Study"
Tag="Bible Study: Romans"

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
    cat << EOF > "$posts_dir"/"$postdate"-am-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
type: post
publishDate: $postdate
url: /$url_subject/$postdate-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
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
