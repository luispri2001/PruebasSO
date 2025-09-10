#!/bin/bash
# Test para comandos básicos basado en la salida de los comandos

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para comandos básicos (evaluando salida)..."
echo "----------------------------------------"

# Crear directorio temporal para archivos de prueba
TEST_DIR=$(mktemp -d)
cd $TEST_DIR

# Crear archivos de prueba
echo "Línea 1" > datos.txt
echo "Línea 2" >> datos.txt
echo "Línea 3" >> datos.txt
echo "Línea 4" >> datos.txt
echo "Línea 5" >> datos.txt
echo "Línea 6" >> datos.txt
echo "Línea 7" >> datos.txt

# Crear un archivo para probar permisos
echo "Archivo para probar permisos" > archivo.txt
chmod 644 archivo.txt  # Reiniciar permisos

# Cargar las soluciones del estudiante
source ./ejercicios/comandos_basicos.sh

# Test 1: Listar archivos ocultos en formato largo
echo -n "Test 1 (listar archivos ocultos): "
touch .archivo_oculto  # Crear un archivo oculto para el test

# Verificar que la salida muestra archivos ocultos
if eval "$EJERCICIO_1" | grep -q "\.archivo_oculto"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_1"
    echo "  La salida debería mostrar archivos ocultos incluyendo .archivo_oculto"
    FALLOS=1
fi

# Test 2: Crear directorio
echo -n "Test 2 (crear directorio): "
# Asegurarse de que no exista el directorio
rm -rf mi_carpeta 2>/dev/null

# Ejecutar el comando del estudiante
eval "$EJERCICIO_2"

# Verificar que el directorio fue creado
if [ -d "mi_carpeta" ]; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_2"
    echo "  El directorio 'mi_carpeta' no fue creado"
    FALLOS=1
fi

# Test 3: Mostrar directorio actual
echo -n "Test 3 (mostrar directorio actual): "
# Verificar que la salida contiene el directorio actual
CURRENT_DIR=$(pwd)
if eval "$EJERCICIO_3" | grep -q "$CURRENT_DIR"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_3"
    echo "  La salida debería mostrar el directorio actual: $CURRENT_DIR"
    FALLOS=1
fi

# Test 4: Cambiar permisos
echo -n "Test 4 (cambiar permisos): "
chmod 644 archivo.txt  # Reiniciar permisos

# Ejecutar el comando del estudiante
eval "$EJERCICIO_4"

# Verificar que el archivo ahora tiene permisos de ejecución para el usuario
if [ -x "archivo.txt" ]; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_4"
    echo "  El archivo 'archivo.txt' no tiene permisos de ejecución para el usuario"
    FALLOS=1
fi

# Test 5: Mostrar primeras líneas
echo -n "Test 5 (mostrar primeras líneas): "
# Verificar que la salida muestra exactamente 5 líneas
LINE_COUNT=$(eval "$EJERCICIO_5" | wc -l)
if [ "$LINE_COUNT" -eq 5 ] && eval "$EJERCICIO_5" | grep -q "Línea 5" && ! eval "$EJERCICIO_5" | grep -q "Línea 6"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_5"
    echo "  La salida debería mostrar exactamente las primeras 5 líneas del archivo"
    FALLOS=1
fi

# Limpiar
cd ..
rm -rf $TEST_DIR

echo "----------------------------------------"
if [ -z "$FALLOS" ]; then
    echo -e "${VERDE}¡Todos los tests basados en salida pasados!${NC}"
    exit 0
else
    echo -e "${ROJO}Algunos tests fallaron. Revisa tus respuestas.${NC}"
    exit 1
fi
