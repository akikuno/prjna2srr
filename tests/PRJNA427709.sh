#!/bin/bash

test_name="$0"

cat <<EOF >test_answer.txt
SRR6425161
SRR6425162
SRR6425163
SRR6425164
EOF

sh ./prjna2.sh PRJNA427709 |
    sort >test_PRJNA427709.txt

if cmp --silent test_PRJNA427709.txt test_answer.txt; then
    echo "${test_name} is passed"
    rm test_*.txt
    exit 0
fi

echo "${test_name} is faild"
echo "files are different"
rm test_*.txt
exit 1
