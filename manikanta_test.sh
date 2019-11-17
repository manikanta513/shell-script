#!/bin/bash


for i in `cat fusion_servers_weekly`
do
echo $i
ssh $i ""