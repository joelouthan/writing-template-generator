#!/bin/bash
#### date command: Linux

#### Post and date specific variables
title="Now Sings My Soul: Psalm "
subject="Prayers in the Psalms"
url_subject="now-sings-my-soul-psalm"
subject_dir=2-now-sings-my-soul-psalm
Category="Prayers"
Tag="Psalms"
Series="Now Sings My Soul: Psalms"

#### Common variables
bin_dir=$HOME/bin
posts_dir=$HOME/Sites/theologic.us/content/posts/$subject_dir
# posts_dir=$HOME/Temp/$subject_dir

# For multiple posts in one day, set the publish time
am_time="T00:00:00-05:00"
noon_time="T12:00:00-06:00"
pm_time="T21:00:00-06:00"

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
publishDate: $postdate$am_time
url: /$url_subject/$postdate-am-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
draft: true
---
<div style="font-variant: small-caps;">

</div>

\`\`\`text

\`\`\`

EOF
    cat << EOF > "$posts_dir"/"$postdate"-noon-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$noon_time
url: /$url_subject/$postdate-noon-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
draft: true
---
<div style="font-variant: small-caps;">

</div>

\`\`\`text

\`\`\`

EOF
    cat << EOF > "$posts_dir"/"$postdate"-pm-"$url_subject".md
---
title: "$title"
author: Joseph Louthan
publishDate: $postdate$pm_time
url: /$url_subject/$postdate-pm-$url_subject/
categories:
  - $Category
tags:
  - "$Tag"
series:
  - "$Series"
draft: true
---
<div style="font-variant: small-caps;">

</div>

\`\`\`text

\`\`\`

EOF
  done
fi
