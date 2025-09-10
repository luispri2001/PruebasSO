#!/bin/bash
# Test para pipes

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para pipes..."
echo "----------------------------------------"

# Cargar las soluciones del estudiante
source ./ejercicios/pipes.sh

# Test 1: Filtrar procesos que contienen "bash"
if [[ "$EJERCICIO_1" == "ps -ef | grep bash" || "$EJERCICIO_1" == "ps aux | grep bash" ]]; then
    echo -e "${VERDE}✓ Test 1 pasado: Comando para filtrar procesos correcto${NC}"
else
    echo -e "${ROJO}✗ Test 1 fallado: El comando para filtrar procesos es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_1"
    echo "  Esperado: ps -ef | grep bash o ps aux | grep bash"
    FALLOS=1
fi

# Test 2: Contar archivos en directorio actual
if [[ "$EJERCICIO_2" == "ls -l | grep ^- | wc -l" || "$EJERCICIO_2" == "find . -type f | wc -l" || "$EJERCICIO_2" == "find . -maxdepth 1 -type f | wc -l" ]]; then
    echo -e "${VERDE}✓ Test 2 pasado: Comando para contar archivos correcto${NC}"
else
    echo -e "${ROJO}✗ Test 2 fallado: El comando para contar archivos es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_2"
    echo "  Esperado: ls -l | grep ^- | wc -l o find . -type f | wc -l"
    FALLOS=1
fi

# Test 3: Mostrar líneas más largas
if [[ "$EJERCICIO_3" == "wc -L texto.txt | sort -nr | head -3" || "$EJERCICIO_3" == "cat texto.txt | awk '{ print length, \$0 }' | sort -nr | head -3 | cut -d' ' -f2-" ]]; then
    echo -e "${VERDE}✓ Test 3 pasado: Comando para mostrar líneas más largas correcto${NC}"
else
    echo -e "${ROJO}✗ Test 3 fallado: El comando para mostrar líneas más largas es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_3"
    echo "  Esperado: wc -L texto.txt | sort -nr | head -3 o comando equivalente"
    FALLOS=1
fi

# Test 4: Encontrar archivos log y ordenarlos por tamaño
if [[ "$EJERCICIO_4" == "find /var/log -name \"*.log\" -type f | xargs ls -lS" || "$EJERCICIO_4" == "find /var/log -name \"*.log\" -type f -exec ls -lS {} \;" ]]; then
    echo -e "${VERDE}✓ Test 4 pasado: Comando para encontrar y ordenar archivos correcto${NC}"
else
    echo -e "${ROJO}✗ Test 4 fallado: El comando para encontrar y ordenar archivos es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_4"
    echo "  Esperado: find /var/log -name \"*.log\" -type f | xargs ls -lS o comando equivalente"
    FALLOS=1
fi

# Test 5: Mostrar procesos que más memoria consumen
if [[ "$EJERCICIO_5" == "ps aux --sort=-%mem | head -5" || "$EJERCICIO_5" == "top -bn1 | head -12 | tail -5" ]]; then
    echo -e "${VERDE}✓ Test 5 pasado: Comando para mostrar procesos por memoria correcto${NC}"
else
    echo -e "${ROJO}✗ Test 5 fallado: El comando para mostrar procesos por memoria es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_5"
    echo "  Esperado: ps aux --sort=-%mem | head -5 o comando equivalente"
    FALLOS=1
fi

echo "----------------------------------------"
if [ -z "$FALLOS" ]; then
    echo -e "${VERDE}¡Todos los tests pasados!${NC}"
    exit 0
else
    echo -e "${ROJO}Algunos tests fallaron. Revisa tus respuestas.${NC}"
    exit 1
fi
