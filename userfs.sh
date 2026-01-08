#!/bin/bash

ROOT="UserFS"
mkdir -p "$ROOT"

active=$(who | awk '{print $1}' | sort -u) 

for u in $active; do
  mkdir -p "$ROOT/$u"
done
