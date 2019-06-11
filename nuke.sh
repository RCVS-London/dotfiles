#!/bin/bash

# Sanity check that removes pesky expo related caches. Use for unexplainable errors.

printf "BOOM!!\nObliterating JavaScript related caches. This may take a moment. \n\n\n"
rm -rf .expo/
watchman watch-del-all
rm -rf $TMPDIR/react-*
rm -rf node_modules/
yarn
open 'rndebugger://set-debugger-loc?host=localhost&port=19001'
expo r -c
