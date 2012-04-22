#!/bin/bash
grep $1 /Users/mirko/Scripts/weather.dat | sed "s/.*=/$2/g" | sed "s/$/$3/g"
