#!/bin/bash

read -p "enter number " num

if [ $num -gt 10 ]
then
    echo "this is greater than 10"
else
    echo "this is not greater than 10 "
fi
