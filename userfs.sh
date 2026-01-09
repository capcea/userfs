#!/bin/bash

ROOT="UserFS"
mkdir -p "$ROOT"

active=$(who | awk '{print $1}' | sort -u)  #stocare useri activi

#crearea folderului fiecarui user si fisierul proc din el

for u in $active; do
  mkdir -p "$ROOT/$u"  
  ps -u "$u" > "$ROOT/$u/proc" 
done
