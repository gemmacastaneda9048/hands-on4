#!/bin/bash

listarElContenido(){
    echo "Escribe la ruta absoluta de la carpeta por listar"
    read -p "Ruta: " ruta

    if [[ -d "$ruta" ]]; then
        ls -l "$ruta"
    else
        echo "El directorio no existe"
    fi
}

crearArchivo(){
    echo "Escribe la cadena de texto que deseas almacenar"
    read -p "Cadena: " cadena
    echo "Escribe la ruta absoluta o relativa donde crear el archivo (incluyendo el nombre del archivo nuevo)"
    read -p "Ruta: " rutaAOR
    echo "$cadena" > "$rutaAOR"
}

compararArchivos(){
    echo "Escribe la ruta absoluta o relativa del primer archivo"
    read -p "Ruta 1: " ruta1
    echo "Escribe la ruta absoluta o relativa del segundo archivo"
    read -p "Ruta 2: " ruta2
    if [[ -f "$ruta1" && -f "$ruta2" ]]; then
        #diff "$ruta1" "$ruta2"
        #si el diff no retorna nada quiere decir que son iguales
        diff "$ruta1" "$ruta2" > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            echo "Los archivos son iguales"
        else
            echo "Los archivos son diferentes"
        fi
    else
        echo "Uno o los dos archivos no existen"
    fi
}

comandoAwk(){
    echo "Ejemplo de uso del comando awk"
    echo "awk '{print \$1}' archivo.txt #imprime la primer palabra de cada linea del archivo 'archivo.txt'"
    echo "awk '/&/ {print \$0}' archivo.txt #imprime todas las lineas que tengan con '&'"
    echo "awk '/&/ {print NR}' archivo.txt #imprime el numero de linea que tengan con '&'"
    echo "para ejemplificar el uso de awk le pediremos que ingrese la ruta a un archivo y se mostrarán la 1er palabra de todas las líneas del archivo que tengan un '&' "
    read -p "Ruta: " rutaAOR
    if [[ -f "$rutaAOR" ]]; then
        echo "el comando que usaremos es awk '{print \$1}' '\$rutaDada'"
        awk '{print $1}' "$rutaAOR"
    else
        echo "El archivo no existe"
    fi
}

comandoGrep(){
    echo "Ejemplo de uso del comando grep"
    echo "grep '&' archivo.txt #imprime todas las líneas que tengan con '&'"
    echo "grep -n '&' archivo.txt #imprime el numero de linea que tengan con '&'"
    echo "para ejemplificar el uso de grep le pediremos que ingrese la ruta a un archivo y se mostrarán todas las líneas que tengan un '&'"
    read -p "Ruta: " rutaAOR
    if [[ -f "$rutaAOR" ]]; then
        echo "el comando que usaremos es grep '&' '\$rutaDada'"
        grep '&' "$rutaAOR"
    else
        echo "El archivo no existe" 
    fi
}

while true; do
    echo "Menu de opciones..."
    echo "Listar el contenido una carpeta = 1"
    echo "Crear un archivo de texto = 2"
    echo "Comparar 2 archivos de texto = 3"
    echo "Ejemplo de uso del comando 'awk' = 4"
    echo "Ejemplo de uso del comando 'grep'= 5"
    echo "salir = 6"
    read -p "escribe la opcion elegida..." opcion

    case $opcion in
        1)
            listarElContenido ;;
        2)
            crearArchivo ;;            
        3)
            compararArchivos ;;
            
        4)
            comandoAwk ;;
        5)
            comandoGrep ;;
        6)
            echo "saliendo..."
            exit 0
            ;;
        *) 
        echo "Esta opcion no es válida" ;;

    esac
    echo "               "
    echo "               "
    echo "               "
done