#!/bin/bash
# Ejercicio 2: Redirecciones
# Soluciones completas

# 1. Escribe el comando para redirigir la salida del comando 'ls -la' a un archivo llamado "listado.txt"
EJERCICIO_1="ls -la > listado.txt"

# 2. Escribe el comando para añadir la salida del comando 'echo "Nueva línea"' al final de un archivo existente llamado "notas.txt"
EJERCICIO_2="echo \"Nueva línea\" >> notas.txt"

# 3. Escribe el comando para contar el número de líneas en un archivo "datos.txt" y guardar el resultado en "conteo.txt"
EJERCICIO_3="wc -l datos.txt > conteo.txt"

# 4. Escribe el comando para redirigir tanto la salida estándar como los errores del comando 'find / -name "archivo.txt"' a un archivo llamado "busqueda.log"
EJERCICIO_4="find / -name \"archivo.txt\" &> busqueda.log"

# 5. Escribe el comando para usar el contenido del archivo "comandos.txt" como entrada para el comando 'sort'
EJERCICIO_5="sort < comandos.txt"
