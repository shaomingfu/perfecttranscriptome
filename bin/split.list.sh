#!/bin/bash

head -n 2500  paired.end.random.list | tail -n 2500 > paired.end.random1.list
head -n 5000  paired.end.random.list | tail -n 2500 > paired.end.random2.list
head -n 7500  paired.end.random.list | tail -n 2500 > paired.end.random3.list
head -n 10000 paired.end.random.list | tail -n 2500 > paired.end.random4.list
head -n 12500 paired.end.random.list | tail -n 2500 > paired.end.random5.list
head -n 14485 paired.end.random.list | tail -n 1985 > paired.end.random6.list
