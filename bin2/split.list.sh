#!/bin/bash

file=./common.list
head -n 3200 $file | tail -n 200 > common.list31
head -n 3400 $file | tail -n 200 > common.list32
head -n 3600 $file | tail -n 200 > common.list33
head -n 3800 $file | tail -n 200 > common.list34
head -n 4000 $file | tail -n 200 > common.list35
