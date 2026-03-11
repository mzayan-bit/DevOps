#!/bin/bash

read -p "Enter your name " name
read -p "Enter your age " age 

future_age=$((age+5))
echo "Hello $name"
echo "you will be $future_age after 5 years"
