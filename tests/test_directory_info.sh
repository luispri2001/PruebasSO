#!/bin/bash
# Test para el script directory-info.sh

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para directory-info.sh..."
echo "----------------------------------------"

# Verificar que el script existe
if [ ! -f ./ejercicios/directory-info.sh ]; then
    echo -e "${ROJO}✗ Test fallado: El script directory-info.sh no existe en la carpeta ejercicios${NC}"
    exit 1
fi

# Verificar que el script tiene permisos de ejecución
if [ ! -x ./ejercicios/directory-info.sh ]; then
    echo -e "${ROJO}✗ Test fallado: El script directory-info.sh no tiene permisos de ejecución${NC}"
    echo "  Ejecuta: chmod +x ./ejercicios/directory-info.sh"
    exit 1
fi

# Crear directorio temporal para pruebas
TEST_DIR=$(mktemp -d)
echo "Directorio de pruebas creado: $TEST_DIR"

# Crear algunos archivos y directorios para probar
mkdir -p "$TEST_DIR/subdir1/subsubdir"
mkdir -p "$TEST_DIR/subdir2"
echo "Contenido de prueba" > "$TEST_DIR/file1.txt"
echo "Más contenido" > "$TEST_DIR/subdir1/file2.txt"
echo "Otro archivo" > "$TEST_DIR/subdir2/file3.txt"
dd if=/dev/zero of="$TEST_DIR/bigfile.dat" bs=1M count=1 2>/dev/null
touch "$TEST_DIR/emptyfile.txt"

# Establecer algunos permisos para probar
chmod 400 "$TEST_DIR/file1.txt"         # read solo para owner
chmod 664 "$TEST_DIR/subdir1/file2.txt" # read/write para owner y group, read para otros
chmod 777 "$TEST_DIR/subdir2/file3.txt" # todos los permisos para todos
chmod 644 "$TEST_DIR/bigfile.dat"       # read/write para owner, read para group y otros
chmod 111 "$TEST_DIR/emptyfile.txt"     # execute para todos

echo "Archivos de prueba creados con diferentes permisos"
echo "----------------------------------------"

# Probar el script con diferentes argumentos

# 1. Sin argumentos (debería usar el directorio actual)
echo "Test 1: Ejecutar sin argumentos"
echo "  ./ejercicios/directory-info.sh"
echo "  Esperado: debe usar el directorio actual"
echo "  Este test requiere verificación manual"
echo ""

# 2. Con un directorio válido
echo "Test 2: Ejecutar con un directorio válido"
echo "  ./ejercicios/directory-info.sh $TEST_DIR"
echo "  Esperado: debe usar el directorio especificado"
echo "  Este test requiere verificación manual"
echo ""

# 3. Con un directorio inválido
echo "Test 3: Ejecutar con un directorio inválido"
echo "  ./ejercicios/directory-info.sh /directorio/que/no/existe"
echo "  Esperado: debe mostrar un error y salir"
echo "  Este test requiere verificación manual"
echo ""

# 4. Con demasiados argumentos
echo "Test 4: Ejecutar con demasiados argumentos"
echo "  ./ejercicios/directory-info.sh $TEST_DIR argumento_extra"
echo "  Esperado: debe mostrar un error y salir"
echo "  Este test requiere verificación manual"
echo ""

echo "----------------------------------------"
echo "Para ejecutar los tests manualmente, copia y pega los comandos anteriores"
echo "Limpiando directorio de pruebas..."
rm -rf "$TEST_DIR"
echo "Test completado. Verifica manualmente que el script funciona correctamente."
