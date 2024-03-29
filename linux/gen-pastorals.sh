#!/bin/bash
#### date command: Linux

#### Post and date specific variables
dow="wed"
title="Meditations: "
subject="Meditations: Pastoral Epistles"
subject_dir=3-meditations-pastorals
url_cat="meditations"
url_sub="1st-timothy"
Category="Meditations"
Tag="1 Timothy"
Series="Meditations: Pastoral Epistles"
time="T00:00:00-05:00"
css="prayer"

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

# Give me the next 20 weeks starting on $dow
for i in {1..20}; do
  echo "$(date -d "next $dow $i weeks" +%F)" >> $weeks
done

listofdates=$(cat $weeks)

# Show a menu and ask for input.
select selectdate in $listofdates; do
    if [ -n "$selectdate" ]; then
        echo ${selectdate}
    fi
    break
done

echo "Publishing "$subject" starting the week of" $selectdate"!"

read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  for j in {0..20}; do
    postdate=`date -d "$selectdate $j weeks" +%F`
    cat << EOF > "$posts_dir"/"$postdate"-"$url_sub".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time
url: /$url_cat/$postdate-$url_sub/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
css: "$css"
showtoc: true
draft: true
---

## The Text


## The Devotion


## The Prayer

<div style="font-variant: small-caps;">

</div>

\`\`\`text

\`\`\`
EOF
	done
fi
