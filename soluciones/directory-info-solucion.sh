#!/bin/bash
# Script para obtener información sobre un directorio específico

# Función para mostrar el menú
show_menu() {
    echo "Menu de opciones:"
    echo "1) Total disk used"
    echo "2) Number of directories"
    echo "3) Number of regular files"
    echo "4) Biggest file"
    echo "5) Smallest file"
    echo "6) Number of files with read permission for the owner"
    echo "7) Number of files with write permission for the group"
    echo "8) Number of files with execution permission for the rest of users"
    echo "9) Number of files with execution permission for everyone"
    echo "10) Exit"
}

# Función para obtener el espacio total usado
get_disk_usage() {
    echo "Total disk used in $WORK_DIR:"
    du -sh "$WORK_DIR"
}

# Función para obtener el número de directorios
get_number_of_directories() {
    echo "Number of directories in $WORK_DIR:"
    find "$WORK_DIR" -type d | wc -l
}

# Función para obtener el número de archivos regulares
get_number_of_files() {
    echo "Number of regular files in $WORK_DIR:"
    find "$WORK_DIR" -type f | wc -l
}

# Función para obtener el archivo más grande
get_biggest_file() {
    echo "Biggest file in $WORK_DIR:"
    find "$WORK_DIR" -type f -exec ls -lh {} \; | sort -k5hr | head -n 1 | awk '{print $9 " (" $5 ")"}'
}

# Función para obtener el archivo más pequeño
get_smallest_file() {
    echo "Smallest file in $WORK_DIR:"
    find "$WORK_DIR" -type f -exec ls -lh {} \; | sort -k5h | head -n 1 | awk '{print $9 " (" $5 ")"}'
}

# Función para contar archivos con permiso de lectura para el propietario
get_owner_read_permission() {
    echo "Number of files with read permission for the owner in $WORK_DIR:"
    find "$WORK_DIR" -type f -perm -400 | wc -l
}

# Función para contar archivos con permiso de escritura para el grupo
get_group_write_permission() {
    echo "Number of files with write permission for the group in $WORK_DIR:"
    find "$WORK_DIR" -type f -perm -020 | wc -l
}

# Función para contar archivos con permiso de ejecución para otros usuarios
get_others_exec_permission() {
    echo "Number of files with execution permission for the rest of users in $WORK_DIR:"
    find "$WORK_DIR" -type f -perm -001 | wc -l
}

# Función para contar archivos con permiso de ejecución para todos
get_all_exec_permission() {
    echo "Number of files with execution permission for everyone in $WORK_DIR:"
    find "$WORK_DIR" -type f -perm -111 | wc -l
}

# Control de argumentos
if [ $# -gt 1 ]; then
    echo "Error: Too many arguments. Usage: $0 [directory_path]"
    exit 1
elif [ $# -eq 1 ]; then
    # Verificar si el argumento es un directorio válido
    if [ ! -d "$1" ]; then
        echo "Error: $1 is not a valid directory"
        exit 1
    fi
    WORK_DIR="$1"
else
    # Si no hay argumentos, usar el directorio actual
    WORK_DIR="."
fi

echo "Working directory: $(readlink -f $WORK_DIR)"
echo ""

# Bucle principal del programa
while true; do
    show_menu
    echo -n "Select an option (1-10): "
    read option
    
    # Validar la entrada del usuario
    if ! [[ "$option" =~ ^[1-9]|10$ ]]; then
        echo "Error: Invalid option. Please enter a number between 1 and 10."
        echo ""
        continue
    fi
    
    echo ""
    
    # Procesar la opción seleccionada
    case $option in
        1) get_disk_usage ;;
        2) get_number_of_directories ;;
        3) get_number_of_files ;;
        4) get_biggest_file ;;
        5) get_smallest_file ;;
        6) get_owner_read_permission ;;
        7) get_group_write_permission ;;
        8) get_others_exec_permission ;;
        9) get_all_exec_permission ;;
        10) echo "Exiting..."; exit 0 ;;
    esac
    
    echo ""
done
