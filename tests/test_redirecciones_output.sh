#!/bin/bash
# Test para redirecciones basado en la salida de los comandos

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para redirecciones (evaluando salida)..."
echo "----------------------------------------"

# Crear directorio temporal para archivos de prueba
TEST_DIR=$(mktemp -d)
cd $TEST_DIR

# Crear archivos de prueba
echo "Línea 1" > datos.txt
echo "Línea 2" >> datos.txt
echo "Línea 3" >> datos.txt
echo "Comandos de ejemplo" > comandos.txt
echo "ls -la" >> comandos.txt
echo "cd /tmp" >> comandos.txt

# Cargar las soluciones del estudiante
source ./ejercicios/redirecciones.sh

# Test 1: Redirigir salida a archivo
echo -n "Test 1 (redirigir salida a archivo): "
# Asegurarse de que no exista el archivo
rm -f listado.txt 2>/dev/null

# Ejecutar el comando del estudiante
eval "$EJERCICIO_1"

# Verificar que el archivo fue creado y contiene la salida esperada
if [ -f "listado.txt" ] && grep -q "datos.txt" listado.txt; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_1"
    echo "  El archivo 'listado.txt' no fue creado o no contiene la salida esperada"
    FALLOS=1
fi

# Test 2: Añadir salida a archivo existente
echo -n "Test 2 (añadir salida a archivo): "
# Crear un archivo inicial
echo "Línea inicial" > notas.txt

# Ejecutar el comando del estudiante
eval "$EJERCICIO_2"

# Verificar que se añadió la nueva línea al final del archivo
if grep -q "Línea inicial" notas.txt && grep -q "Nueva línea" notas.txt; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_2"
    echo "  El archivo 'notas.txt' no contiene tanto la línea inicial como la nueva línea"
    FALLOS=1
fi

# Test 3: Contar líneas y guardar resultado
echo -n "Test 3 (contar líneas y guardar): "
# Asegurarse de que no exista el archivo
rm -f conteo.txt 2>/dev/null

# Ejecutar el comando del estudiante
eval "$EJERCICIO_3"

# Verificar que el archivo fue creado y contiene el conteo correcto
if [ -f "conteo.txt" ] && grep -q "3" conteo.txt; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_3"
    echo "  El archivo 'conteo.txt' no fue creado o no contiene el conteo correcto (3)"
    FALLOS=1
fi

# Test 4: Redirigir stdout y stderr
echo -n "Test 4 (redirigir stdout y stderr): "
# Asegurarse de que no exista el archivo
rm -f busqueda.log 2>/dev/null

# Modificar el comando para evitar buscar en todo el sistema
MODIFIED_CMD=$(echo "$EJERCICIO_4" | sed 's|find / |find . |g')

# Ejecutar el comando modificado
eval "$MODIFIED_CMD"

# Verificar que el archivo fue creado y contiene la salida
if [ -f "busqueda.log" ]; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando (modificado): $MODIFIED_CMD"
    echo "  El archivo 'busqueda.log' no fue creado"
    FALLOS=1
fi

# Test 5: Usar archivo como entrada
echo -n "Test 5 (usar archivo como entrada): "
# Ejecutar el comando del estudiante
RESULTADO=$(eval "$EJERCICIO_5")

# Verificar que la salida contiene las líneas ordenadas
if echo "$RESULTADO" | grep -q "cd /tmp" && echo "$RESULTADO" | grep -q "Comandos de ejemplo" && echo "$RESULTADO" | grep -q "ls -la"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_5"
    echo "  La salida no muestra el contenido ordenado del archivo 'comandos.txt'"
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
