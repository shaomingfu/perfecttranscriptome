#!/bin/bash

file=./common.list
head -n 100 $file | tail -n 100 > common.list1
head -n 200 $file | tail -n 100 > common.list2
head -n 300 $file | tail -n 100 > common.list3
head -n 400 $file | tail -n 100 > common.list4
head -n 500 $file | tail -n 100 > common.list5
head -n 600 $file | tail -n 100 > common.list6
