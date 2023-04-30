#!/bin/bash 


echo "1) Crear un archivo"
echo "2) Borrar un archivo"
echo "3) Agregar linea a un archivo"
echo "4) Borrar linea de un archivo"
echo "5) Salir"

read input

crearArchivo (){

    read -p "Ingrese nombre del archivo que desea crear(sin su extension): " input

    if [ -e $input ];then
    echo "el archivo $input ya existe"
    else
    read -p "elija la extension de su archivo: " extension
    archivo="$input.$extension"
    touch $archivo
    fi

}

borrarArchivo (){

    read -p "Ingrese nombre del archivo que desea borrar: " input

    if [ -e $input ]; then
    rm $input
    echo "El archivo $input se borro correctamente" 
    else 
    echo "El archivo $input no existe."
    fi
}

agregarLinea (){

    read -p "Ingrese el nombre del archivo(con su extension): " input

    if [ -e $input ]; then
    read -p "Ingrese la linea que desea agregar: " linea
    if grep -q "$linea" "$input"; then
    echo "$linea ya existe en $input" 
    else 
    echo "$linea" >> $input 
    echo "Se agrego la linea $linea a $input"
    fi
    else 
    echo "El archivo $input no existe."
fi
}


borrarLinea (){
    read -p "Ingrese el nombre del archivo(con su extension): " input 

    if [ -e $input ]; then
        read -p "Ingrese la linea que desea borrar: " linea
    if grep -q "$linea" $input; then
        sed -i "/^$linea/d" $input
        echo "$linea se borro de $input exitosamente!"
    else 
        echo "$linea no existe en $input"
    fi
    else 
    echo "No se a encontrado el archivo."
    fi

}

case $input in 
1) crearArchivo
;;
2) borrarArchivo
;;
3) agregarLinea
;;
4) borrarLinea
;;
5) echo "Hasta la proxima!"
;;
*) echo "Opcion no valida."
esac

