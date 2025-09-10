# PruebasSO - Corrector Automático de Comandos

[![Tests](https://github.com/luispri2001/PruebasSO/actions/workflows/test.yml/badge.svg)](https://github.com/luispri2001/PruebasSO/actions/workflows/test.yml)


[![GitHub license](https://img.shields.io/github/license/luispri2001/PruebasSO)](https://github.com/luispri2001/PruebasSO/blob/main/LICENSE)

## Descripción
Este repositorio contiene un sistema automático para evaluar prácticas de comandos de sistemas operativos. Los estudiantes pueden crear un fork de este repositorio, completar los ejercicios y recibir feedback automático sobre sus soluciones.

**Nota: Esta versión del repositorio incluye las soluciones completas como prueba de concepto para verificar que los tests funcionan correctamente. En un entorno de enseñanza real, las soluciones deberían eliminarse antes de compartir el repositorio con los estudiantes.**

## Cómo funciona
1. El estudiante hace un fork de este repositorio
2. Completa los ejercicios en la carpeta `ejercicios/`
3. Los tests automáticos evalúan la solución
4. Los badges muestran el estado de los tests

## Instrucciones para estudiantes
1. Crea un fork de este repositorio
2. Clona tu fork a tu máquina local
3. Completa los ejercicios en la carpeta `ejercicios/`
4. Haz commit y push de tus cambios
5. Verifica el estado de tus soluciones en la pestaña Actions de tu repositorio

## Ejercicios disponibles
Este repositorio incluye cuatro tipos de ejercicios:

1. **Comandos básicos**: Uso de comandos fundamentales como `ls`, `mkdir`, `chmod`, etc.
2. **Redirecciones**: Manejo de entrada/salida estándar con `>`, `>>`, `<`, etc.
3. **Pipes**: Uso de tuberías (`|`) para combinar comandos
4. **Shell scripting**: Creación de un script bash interactivo (`directory-info.sh`) que muestra información sobre directorios

Los ejercicios 1-3 tienen 5 preguntas cada uno que evalúan diferentes aspectos del uso de comandos en sistemas Unix/Linux. El ejercicio 4 es un script completo que demuestra el uso de funciones, control de flujo, y comandos avanzados en bash.

## Configuración de badges dinámicos
Para que los badges dinámicos funcionen correctamente, es necesario configurar:

1. Un GitHub Gist (público o privado)
2. Un token de acceso personal con permisos de gist
3. Los secrets GIST_ID y GIST_SECRET en el repositorio

Consulta el archivo [INSTRUCTOR_GUIDE.md](INSTRUCTOR_GUIDE.md) para instrucciones detalladas.

## Estructura del repositorio
- `ejercicios/`: Contiene los archivos donde los estudiantes deben escribir sus soluciones
- `tests/`: Contiene los scripts de prueba automatizados
- `.github/workflows/`: Contiene los archivos de configuración para GitHub Actions
- `STUDENT_INSTRUCTIONS.md`: Guía detallada para estudiantes
- `INSTRUCTOR_GUIDE.md`: Guía para instructores y configuración
