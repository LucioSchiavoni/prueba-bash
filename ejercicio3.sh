#!/bin/bash

funcNum (){

suma=0
    for num in "$@"; 
    do
    suma=$((suma + num))  
    echo "$num" >> numeros.txt

    done
     echo "$suma" >> numeros.txt
    cat numeros.txt
echo "La suma de todos los numeros es $suma"
}


funcNum "$@"




