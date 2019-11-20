#!/bin/bash
touch /tmp/compare.txt
diff %> $1 $2 >> /tmp/compare.txt
grep -R > /tmp/compare.txt
