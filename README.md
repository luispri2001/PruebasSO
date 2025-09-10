# PruebasSO - Corrector Automático para Comandos Básicos

[![Tests](https://github.com/luispri2001/PruebasSO/actions/workflows/test_output.yml/badge.svg)](https://github.com/luispri2001/PruebasSO/actions/workflows/test_output.yml)
[![GitHub license](https://img.shields.io/github/license/luispri2001/PruebasSO)](https://github.com/luispri2001/PruebasSO/blob/main/LICENSE)

## Descripción
Este repositorio contiene un sistema automático para evaluar prácticas de comandos básicos de sistemas operativos. Los estudiantes pueden crear un fork de este repositorio, completar los ejercicios y recibir feedback automático sobre sus soluciones.

**Nota: Esta versión del repositorio incluye las soluciones completas como prueba de concepto para verificar que los tests funcionan correctamente. En un entorno de enseñanza real, las soluciones deberían eliminarse antes de compartir el repositorio con los estudiantes.**

## Cómo funciona
1. El estudiante hace un fork de este repositorio
2. Completa los ejercicios en el archivo `ejercicios/comandos_basicos.sh`
3. Los tests automáticos evalúan la solución usando Docker
4. Los resultados se muestran como artefactos descargables en la página de Actions de GitHub

## Estructura del repositorio

- **ejercicios/comandos_basicos.sh**: Archivo donde los estudiantes completan los comandos básicos
- **tests/test_comandos_basicos_output.sh**: Script que verifica la salida de los comandos
- **.github/workflows/test_output.yml**: Workflow que ejecuta los tests en Docker

## Ejecución de tests

El sistema utiliza Docker para crear un entorno controlado donde se ejecutan los tests. Esto garantiza que:

1. El entorno de pruebas es consistente
2. Se evitan problemas de configuración o dependencias
3. Los resultados son reproducibles

## Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo LICENSE para más detalles.

## Instrucciones para estudiantes
1. Crea un fork de este repositorio
2. Clona tu fork a tu máquina local
3. Completa los ejercicios en la carpeta `ejercicios/`
4. Haz commit y push de tus cambios
5. Verifica el estado de tus soluciones en la pestaña Actions de tu repositorio
6. Descarga el artefacto `test-results` para ver un resumen de tus resultados

## Ejercicios disponibles
Este repositorio incluye cuatro tipos de ejercicios:

1. **Comandos básicos**: Uso de comandos fundamentales como `ls`, `mkdir`, `chmod`, etc.
2. **Redirecciones**: Manejo de entrada/salida estándar con `>`, `>>`, `<`, etc.
3. **Pipes**: Uso de tuberías (`|`) para combinar comandos
4. **Shell scripting**: Creación de un script bash interactivo (`directory-info.sh`) que muestra información sobre directorios

Los ejercicios 1-3 tienen 5 preguntas cada uno que evalúan diferentes aspectos del uso de comandos en sistemas Unix/Linux. El ejercicio 4 es un script completo que demuestra el uso de funciones, control de flujo, y comandos avanzados en bash.

## Evaluación de ejercicios
Los ejercicios pueden ser evaluados de dos formas diferentes:

1. **Evaluación literal**: Compara el comando escrito por el estudiante con una lista de comandos considerados correctos. Este método es rápido pero menos flexible, ya que solo acepta comandos específicos.

2. **Evaluación basada en salida**: Ejecuta el comando proporcionado por el estudiante y verifica que la salida sea la esperada. Este método es más flexible y permite múltiples soluciones para un mismo problema, siempre que produzcan el resultado correcto.

Para ejecutar los tests basados en salida manualmente:
```bash
chmod +x ./tests/*_output.sh
./tests/test_comandos_basicos_output.sh
./tests/test_redirecciones_output.sh
./tests/test_pipes_output.sh
```

## Visualización de resultados

Después de que los tests se hayan ejecutado en GitHub Actions, podrás ver los resultados de dos formas:

1. **En los logs de GitHub Actions**: Al final de la ejecución del workflow, se mostrará un resumen de los resultados de los tests.

2. **Como artefacto descargable**: Los resultados se guardan como un archivo Markdown que puedes descargar desde la página de Actions.

   ![Ejemplo de Artefacto](https://docs.github.com/assets/cb-25896/mw-1440/images/help/actions/artifact-download-link.webp)

El archivo de resultados tendrá un formato similar a este:

```markdown
# Resultados de los Tests

## Comandos Básicos
✅ **Completado**

## Redirecciones
✅ **Completado**

## Pipes
❌ **Pendiente**

## Shell Scripting
✅ **Completado**
```

## Estructura del repositorio
- `ejercicios/`: Contiene los archivos donde los estudiantes deben escribir sus soluciones
- `tests/`: Contiene los scripts de prueba automatizados
- `.github/workflows/`: Contiene los archivos de configuración para GitHub Actions
- `STUDENT_INSTRUCTIONS.md`: Guía detallada para estudiantes
- `INSTRUCTOR_GUIDE.md`: Guía para instructores y configuración
