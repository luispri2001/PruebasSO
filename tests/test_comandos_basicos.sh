#!/bin/bash
# Test para comandos básicos

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para comandos básicos..."
echo "----------------------------------------"

# Cargar las soluciones del estudiante
source ./ejercicios/comandos_basicos.sh

# Test 1: Listar archivos ocultos en formato largo
if [[ "$EJERCICIO_1" == "ls -la" || "$EJERCICIO_1" == "ls -al" ]]; then
    echo -e "${VERDE}✓ Test 1 pasado: Comando para listar archivos ocultos correcto${NC}"
else
    echo -e "${ROJO}✗ Test 1 fallado: El comando para listar archivos ocultos es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_1"
    echo "  Esperado: ls -la o ls -al"
    FALLOS=1
fi

# Test 2: Crear directorio
if [[ "$EJERCICIO_2" == "mkdir mi_carpeta" ]]; then
    echo -e "${VERDE}✓ Test 2 pasado: Comando para crear directorio correcto${NC}"
else
    echo -e "${ROJO}✗ Test 2 fallado: El comando para crear directorio es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_2"
    echo "  Esperado: mkdir mi_carpeta"
    FALLOS=1
fi

# Test 3: Mostrar directorio actual
if [[ "$EJERCICIO_3" == "pwd" ]]; then
    echo -e "${VERDE}✓ Test 3 pasado: Comando para mostrar directorio actual correcto${NC}"
else
    echo -e "${ROJO}✗ Test 3 fallado: El comando para mostrar directorio actual es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_3"
    echo "  Esperado: pwd"
    FALLOS=1
fi

# Test 4: Cambiar permisos
if [[ "$EJERCICIO_4" == "chmod u+x archivo.txt" || "$EJERCICIO_4" == "chmod 744 archivo.txt" || "$EJERCICIO_4" == "chmod 700 archivo.txt" || "$EJERCICIO_4" == "chmod +x archivo.txt" ]]; then
    echo -e "${VERDE}✓ Test 4 pasado: Comando para cambiar permisos correcto${NC}"
else
    echo -e "${ROJO}✗ Test 4 fallado: El comando para cambiar permisos es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_4"
    echo "  Esperado: chmod u+x archivo.txt o equivalente"
    FALLOS=1
fi

# Test 5: Mostrar primeras líneas
if [[ "$EJERCICIO_5" == "head -n 5 datos.txt" || "$EJERCICIO_5" == "head -5 datos.txt" ]]; then
    echo -e "${VERDE}✓ Test 5 pasado: Comando para mostrar primeras líneas correcto${NC}"
else
    echo -e "${ROJO}✗ Test 5 fallado: El comando para mostrar primeras líneas es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_5"
    echo "  Esperado: head -n 5 datos.txt o head -5 datos.txt"
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
