#!/bin/bash

read -p "Enter first number " num1
read -p "Enter second number " num2

sum=$((num1+num2))
mul=$((num1*num2))
div=$((num1/num2))

echo "Sum  of $num1 and $num2 is  $sum"
echo "Multiplication of $num1 and $num2 is $mul"
echo "Division of $num1 and $num2 is $div"

