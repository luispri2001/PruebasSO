#!/bin/bash
# Test para redirecciones

# Colores para la salida
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

echo "Ejecutando tests para redirecciones..."
echo "----------------------------------------"

# Cargar las soluciones del estudiante
source ./ejercicios/redirecciones.sh

# Test 1: Redirigir salida a un archivo
if [[ "$EJERCICIO_1" == "ls -la > listado.txt" ]]; then
    echo -e "${VERDE}✓ Test 1 pasado: Comando para redirigir salida correcto${NC}"
else
    echo -e "${ROJO}✗ Test 1 fallado: El comando para redirigir salida es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_1"
    echo "  Esperado: ls -la > listado.txt"
    FALLOS=1
fi

# Test 2: Añadir salida al final de un archivo
if [[ "$EJERCICIO_2" == "echo \"Nueva línea\" >> notas.txt" ]]; then
    echo -e "${VERDE}✓ Test 2 pasado: Comando para añadir al final correcto${NC}"
else
    echo -e "${ROJO}✗ Test 2 fallado: El comando para añadir al final es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_2"
    echo "  Esperado: echo \"Nueva línea\" >> notas.txt"
    FALLOS=1
fi

# Test 3: Contar líneas y guardar resultado
if [[ "$EJERCICIO_3" == "wc -l datos.txt > conteo.txt" ]]; then
    echo -e "${VERDE}✓ Test 3 pasado: Comando para contar líneas correcto${NC}"
else
    echo -e "${ROJO}✗ Test 3 fallado: El comando para contar líneas es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_3"
    echo "  Esperado: wc -l datos.txt > conteo.txt"
    FALLOS=1
fi

# Test 4: Redirigir salida estándar y errores
if [[ "$EJERCICIO_4" == "find / -name \"archivo.txt\" &> busqueda.log" || "$EJERCICIO_4" == "find / -name \"archivo.txt\" > busqueda.log 2>&1" ]]; then
    echo -e "${VERDE}✓ Test 4 pasado: Comando para redirigir stdout y stderr correcto${NC}"
else
    echo -e "${ROJO}✗ Test 4 fallado: El comando para redirigir stdout y stderr es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_4"
    echo "  Esperado: find / -name \"archivo.txt\" &> busqueda.log o equivalente"
    FALLOS=1
fi

# Test 5: Usar contenido como entrada
if [[ "$EJERCICIO_5" == "sort < comandos.txt" ]]; then
    echo -e "${VERDE}✓ Test 5 pasado: Comando para usar contenido como entrada correcto${NC}"
else
    echo -e "${ROJO}✗ Test 5 fallado: El comando para usar contenido como entrada es incorrecto${NC}"
    echo "  Tu respuesta: $EJERCICIO_5"
    echo "  Esperado: sort < comandos.txt"
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
