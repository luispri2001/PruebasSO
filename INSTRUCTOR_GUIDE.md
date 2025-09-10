# Guía para Instructores

Este documento explica cómo configurar y utilizar este repositorio para evaluar prácticas de comandos de sistemas operativos.

## Configuración inicial

Para que los badges dinámicos funcionen correctamente, debes seguir estos pasos:

1. Crear un GitHub Gist que almacenará los datos de los badges
   - Ve a https://gist.github.com/
   - Crea un nuevo gist público o privado
   - Anota el ID del gist (parte de la URL después de tu nombre de usuario)

2. Crear un token de acceso personal (PAT) en GitHub
   - Ve a Settings -> Developer settings -> Personal access tokens
   - Genera un nuevo token con permisos de gist
   - Copia el token generado

3. Agregar secrets al repositorio
   - En tu repositorio, ve a Settings -> Secrets and variables -> Actions
   - Agrega dos secrets:
     - `GIST_ID`: El ID del gist que creaste
     - `GIST_SECRET`: El token de acceso personal que generaste

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
