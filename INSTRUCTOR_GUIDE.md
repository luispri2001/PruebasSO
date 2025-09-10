# Guía para Instructores

Este documento explica cómo configurar y utilizar este repositorio para evaluar prácticas de comandos de sistemas operativos.

## Configuración inicial

El sistema ahora genera reportes de resultados como artefactos de GitHub Actions, lo que elimina la necesidad de configurar Gist o tokens de acceso personal.

### Visualización de resultados

Los resultados de los tests se pueden ver de dos formas:

1. **En los logs de GitHub Actions**: Al final de la ejecución del workflow, se muestra un resumen de los resultados.

2. **Como artefacto descargable**: Los resultados se guardan como un archivo Markdown que se puede descargar desde la página de Actions.

## Personalización de tests

Para modificar o añadir tests, puedes editar los archivos en la carpeta `tests/`:

- `test_comandos_basicos.sh`: Tests literales para comandos básicos
- `test_comandos_basicos_output.sh`: Tests basados en salida para comandos básicos
- `test_redirecciones.sh`: Tests literales para redirecciones
- `test_redirecciones_output.sh`: Tests basados en salida para redirecciones
- `test_pipes.sh`: Tests literales para pipes
- `test_pipes_output.sh`: Tests basados en salida para pipes
- `test_directory_info.sh`: Tests para el script interactivo

### Tests literales vs. Tests basados en salida

- **Tests literales**: Comparan directamente el comando proporcionado por el estudiante con una lista de comandos considerados correctos. Son más rápidos pero menos flexibles.

- **Tests basados en salida**: Ejecutan el comando proporcionado por el estudiante y verifican que la salida sea la esperada. Son más flexibles y permiten múltiples soluciones para un mismo problema.

## Solución a errores comunes

Si los badges se crean pero no se actualizan:
1. **El token ha expirado**: Genera un nuevo token y actualiza el secret GIST_SECRET.
2. **Problemas de permisos**: Verifica que el token tenga permisos para escribir en el Gist.

## Personalización de los ejercicios

Puedes modificar los ejercicios editando los archivos en la carpeta `ejercicios/`. Si cambias los ejercicios, asegúrate de actualizar también los scripts de prueba en la carpeta `tests/`.

## Evaluación manual

Aunque el sistema está diseñado para ser automático, puedes ejecutar los scripts de prueba manualmente:

```bash
# Dar permisos de ejecución a los scripts
chmod +x ./tests/*.sh

# Ejecutar los tests
./tests/test_comandos_basicos.sh
./tests/test_redirecciones.sh
./tests/test_pipes.sh
```

## Soluciones para los ejercicios

Las soluciones esperadas para cada ejercicio están codificadas en los scripts de prueba, dentro de las comparaciones. Por ejemplo, para el primer ejercicio de comandos básicos, la solución esperada es `ls -la` o `ls -al`.

## Agregar más categorías de ejercicios

Para agregar una nueva categoría de ejercicios:

1. Crea un nuevo archivo de ejercicios en la carpeta `ejercicios/`
2. Crea un nuevo script de prueba en la carpeta `tests/`
3. Actualiza el archivo de workflow en `.github/workflows/test.yml` para incluir la nueva categoría
4. Actualiza el README.md para mencionar la nueva categoría
5. **Importante**: Crea un nuevo archivo en tu Gist con el nombre que usarás en el workflow (por ejemplo, `nueva_categoria.json`)
