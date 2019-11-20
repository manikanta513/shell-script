#!/bin/bash
diff -h $1 $2 > /tmp/compare.txt
grep -R > /tmp/compare.txt
