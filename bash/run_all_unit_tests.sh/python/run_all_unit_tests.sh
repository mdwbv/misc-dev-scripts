#!/bin/bash

#############################################################################
# File:         run_all_unit_tests.sh
#
# Purpose:      Executes the unit-tests regardless of calling directory
#
# Created:      13th February 2019
# Updated:      17th March 2019
#
# Author:       Matthew Wilson
#
#############################################################################

source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do
  dir="$(cd -P "$(dirname "$source")" && pwd)"
  source="$(readlink "$source")"
  [[ $source != /* ]] && source="$dir/$source"
done
dir="$( cd -P "$( dirname "$source" )" && pwd )"


# This will operate recursively as long as each subdirectory of $dir/tests
# contains an __init__.py file (which may be empty)
python -m unittest discover $dir/tests


