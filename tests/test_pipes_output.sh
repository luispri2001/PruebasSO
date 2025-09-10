#!/bin/bash
# Test para pipes basado en la salida de los comandos

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para pipes (evaluando salida)..."
echo "----------------------------------------"

# Crear directorio temporal para archivos de prueba
TEST_DIR=$(mktemp -d)
cd $TEST_DIR

# Crear archivos de prueba
echo "Línea corta" > texto.txt
echo "Esta es una línea un poco más larga que la anterior" >> texto.txt
echo "Esta es la línea más larga de todas, debería aparecer primero al ordenar por longitud" >> texto.txt
echo "Otra línea mediana para el test" >> texto.txt

# Cargar las soluciones del estudiante
source ./ejercicios/pipes.sh

# Test 1: Filtrar procesos que contienen "bash"
echo -n "Test 1 (filtrar procesos con 'bash'): "
# Verificamos que la salida contenga la palabra bash
if eval "$EJERCICIO_1" | grep -q "bash"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_1"
    echo "  La salida debería contener la palabra 'bash'"
    FALLOS=1
fi

# Test 2: Contar archivos en directorio actual
echo -n "Test 2 (contar archivos): "
# Creamos un entorno controlado para contar archivos
mkdir -p archivos_test
touch archivos_test/file1.txt
touch archivos_test/file2.txt
touch archivos_test/file3.txt
cd archivos_test

# Obtenemos el conteo real
REAL_COUNT=$(find . -type f | wc -l)
# Obtenemos el conteo del comando del estudiante
STUDENT_COUNT=$(eval "$EJERCICIO_2")

cd ..
if [[ "$STUDENT_COUNT" == "$REAL_COUNT" ]]; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_2"
    echo "  Resultado: $STUDENT_COUNT"
    echo "  Esperado: $REAL_COUNT"
    FALLOS=1
fi

# Test 3: Mostrar líneas más largas
echo -n "Test 3 (líneas más largas): "
# Verificar que la salida contiene parte de la línea más larga
if eval "$EJERCICIO_3" | grep -q "línea más larga"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_3"
    echo "  La salida debería mostrar las líneas más largas del archivo"
    FALLOS=1
fi

# Test 4: Encontrar archivos log y ordenarlos por tamaño
echo -n "Test 4 (ordenar archivos log): "
# Como no podemos acceder a /var/log en el entorno de prueba, simulamos
mkdir -p fake_logs
echo "contenido" > fake_logs/small.log
echo "contenido más grande" > fake_logs/medium.log
dd if=/dev/zero of=fake_logs/large.log bs=1K count=10 2>/dev/null

# Modificamos el comando del estudiante para usar nuestro directorio de prueba
MODIFIED_CMD=$(echo "$EJERCICIO_4" | sed 's|/var/log|./fake_logs|g')

# Verificar que la salida muestra los archivos ordenados por tamaño
if eval "$MODIFIED_CMD" | grep -q "large.log" && eval "$MODIFIED_CMD" | head -1 | grep -q "large.log"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando (modificado para test): $MODIFIED_CMD"
    echo "  La salida debería mostrar los archivos log ordenados por tamaño (el más grande primero)"
    FALLOS=1
fi

# Test 5: Mostrar procesos que más memoria consumen
echo -n "Test 5 (procesos por memoria): "
# Verificar que el comando produce alguna salida y contiene información sobre procesos
if eval "$EJERCICIO_5" | grep -q -E "(PID|COMMAND|%MEM|RSS)"; then
    echo -e "${VERDE}✓ Pasado${NC}"
else
    echo -e "${ROJO}✗ Fallado${NC}"
    echo "  Tu comando: $EJERCICIO_5"
    echo "  La salida debería mostrar información sobre procesos ordenados por consumo de memoria"
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
