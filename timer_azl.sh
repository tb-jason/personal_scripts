#!/bin/bash
# For use on Amazon Linux 2

if [ -z $1 ]
then
  echo ERROR: Provide a command
  exit
fi

SECONDS=0

# Execute Command
$@

# Print Completion Time
date -d@$(($SECONDS)) -u "+Completed in %M minutes %S seconds"

