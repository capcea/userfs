#!/bin/bash

ROOT="UserFS"
mkdir -p "$ROOT"

active=$(who | awk '{print $1}' | sort -u)  #stocare useri activi

#crearea folderului fiecarui user si fisierul proc din el

for u in $active; do
  mkdir -p "$ROOT/$u"  
  ps -u "$u" > "$ROOT/$u/proc"
  rm -f "$ROOT/$u/lastlogin" #sterge last login daca inca e activ
done

for d in "$ROOT"/*; do
  [ -d "$d" ] || continue
  user=$(basename "$d")

  echo "$active" | grep -qx "$user"
  if [ $? -ne 0 ]; then
    : > "$d/proc"
    lastlog -u "$user" > "$d/lastlogin" 2>/dev/null
  fi
done