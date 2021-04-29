#!/bin/bash

# variables
output=~/my_research/sys_info.txt

echo "This is my first script"
echo "Today's day is $(date)"
echo "Uname info is $(uname -a)"

my_ip=$(ifconfig | head | tail -1 | awk -F' ' '{print $2}')
echo "My IP address is $my_ip"
echo "My hostname is $HOSTNAME"

if [ ! -d ~/my_research ]
then
  mkdir ~/my_research
fi

if [ -f $output ]
then
  rm $output
fi

find /home -type f -perm 777 2>/dev/null >> $output
ps aux | head >> $output

files=('/etc/passwd' '/etc/shadow')

# this loop will print out the permissions of each file
for file in ${files[@]}
do
  ls -l $file >> $output
done

