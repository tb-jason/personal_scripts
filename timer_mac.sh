#!/bin/bash
# For use on MacOS X

if [ -z $1 ]
then
  echo ERROR: Provide a command
  exit
fi

SECONDS=0

# Execute command
$@

# Print Completion Time
date -ju -f "%s" $SECONDS "+Completed in %M minutes %S seconds"

