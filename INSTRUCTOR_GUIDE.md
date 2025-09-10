# Guía para Instructores

Este documento explica cómo configurar y utilizar este repositorio para evaluar prácticas de comandos básicos de sistemas operativos.

## Descripción general

Este repositorio ha sido simplificado para enfocarse únicamente en la evaluación de comandos básicos de Linux utilizando Docker para garantizar un entorno consistente.

## Estructura del repositorio

- **ejercicios/comandos_basicos.sh**: Archivo donde los estudiantes completan los comandos básicos
- **tests/test_comandos_basicos_output.sh**: Script que verifica la salida de los comandos
- **.github/workflows/test_output.yml**: Workflow que ejecuta los tests en Docker

## Funcionamiento

1. El workflow crea una imagen de Docker con Ubuntu y las dependencias necesarias
2. Copia los archivos de ejercicios y tests al contenedor
3. Ejecuta el script de prueba que evalúa si los comandos proporcionados por los estudiantes producen los resultados esperados
4. Genera un informe que se guarda como artefacto de GitHub Actions

## Ventajas del enfoque basado en Docker

- **Entorno controlado**: Evita problemas de configuración o dependencias
- **Consistencia**: Los tests siempre se ejecutan en el mismo entorno
- **Reproducibilidad**: Cualquiera puede ejecutar los tests y obtener los mismos resultados
- **Facilidad de mantenimiento**: El sistema es fácil de actualizar o ampliar

## Personalización

Si desea ampliar este sistema para incluir más ejercicios:

1. Añada nuevos archivos de ejercicios en la carpeta `ejercicios/`
2. Cree scripts de prueba correspondientes en la carpeta `tests/`
3. Actualice el archivo Dockerfile en el workflow para incluir las nuevas dependencias si son necesarias
4. Modifique el workflow para ejecutar los nuevos tests

## Solución a errores comunes

### Problemas con permisos de ejecución

Si los scripts no se ejecutan correctamente, asegúrese de que tienen permisos de ejecución:

```bash
chmod +x ./tests/*.sh
chmod +x ./ejercicios/*.sh
```

### Error al ejecutar Docker

Si hay problemas con la ejecución de Docker en GitHub Actions, verifique:

1. Que la imagen se está construyendo correctamente
2. Que los archivos se están copiando al contenedor
3. Que el comando por defecto está correctamente configurado

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
