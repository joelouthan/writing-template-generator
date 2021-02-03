#!/bin/bash
#### date command: Linux

#### Post and date specific variables
dow="tue"
title="Now Sings My Soul: Psalm "
subject="Prayers in the Psalms"
url_subject="now-sings-my-soul-psalm"
subject_dir="2-now-sings-my-soul-psalm"
Category="Prayers"
Tag="Psalms"
Series="Now Sings My Soul: Psalms"

#### Common variables
bin_dir=$HOME/bin
posts_dir=$HOME/Sites/theologic.us/content/posts/$subject_dir
# posts_dir=$HOME/Temp/$subject_dir

# For multiple posts in one day, set the publish time
time_0600="T06:00:00-06:00"
time_0900="T09:00:00-06:00"
time_1200="T12:00:00-06:00"
time_1500="T15:00:00-06:00"
time_1800="T18:00:00-06:00"
time_2100="T21:00:00-06:00"

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
	  postdate="$(date -d "$selectdate $j weeks" +%F)"
    cat << EOF > "$posts_dir"/"$postdate"-0600-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time_0600
url: /$url_subject/$postdate-0600-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
&nbsp;


EOF
    cat << EOF > "$posts_dir"/"$postdate"-0900-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time_0900
url: /$url_subject/$postdate-0900-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
    start-here
EOF
    cat << EOF > "$posts_dir"/"$postdate"-1200-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time_1200
url: /$url_subject/$postdate-1200-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
    start-here
EOF
    cat << EOF > "$posts_dir"/"$postdate"-1500-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time
url: /$url_subject/$postdate-1500-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
&nbsp;


EOF
    cat << EOF > "$posts_dir"/"$postdate"-1800-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time_1800
url: /$url_subject/$postdate-1800-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
&nbsp;


EOF
    cat << EOF > "$posts_dir"/"$postdate"-2100-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$time_2100
url: /$url_subject/$postdate-2100-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
showtoc: false
css: "prayer"
draft: true
---
<div style="font-variant: small-caps;">

</div>
&nbsp;


EOF
  done
fi
