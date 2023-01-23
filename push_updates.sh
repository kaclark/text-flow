#!/bin/bash
echo "Checking comment section for new entries"

#include todoist task id, can be found with url
TASK=0000000

#API key can be found in integrations in settings
curl https://api.todoist.com/sync/v9/items/get \
    -H "Authorization: Bearer 000000000000000"\
    -d item_id=$TASK \
    -o \
    > ./tmp/task_dump.txt

python handle_task_dump.py

#Doc ID can be found in doc url /d/000000/edit
DOC_ID="0000000000000"
python append_to_file.py -f $DOC_ID
echo

