#!/bin/bash
# Ejercicio 3: Pipes
# Soluciones completas

# 1. Escribe el comando para listar todos los procesos y filtrar solo aquellos que contienen la palabra "bash"
EJERCICIO_1="ps aux | grep bash"

# 2. Escribe el comando para contar cuántos archivos hay en el directorio actual (solo archivos, no directorios)
EJERCICIO_2="find . -type f | wc -l"

# 3. Escribe el comando para mostrar las 3 líneas más largas de un archivo "texto.txt"
EJERCICIO_3="wc -L texto.txt | sort -nr | head -n 3"

# 4. Escribe el comando para encontrar todos los archivos .log en /var/log y ordenarlos por tamaño
EJERCICIO_4="find /var/log -name \"*.log\" | xargs ls -lS"

# 5. Escribe el comando para mostrar los 5 procesos que más memoria están consumiendo
EJERCICIO_5="ps aux | sort -k6nr | head -n 5"
