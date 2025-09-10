# Guía para Instructores

Este documento explica cómo configurar y utilizar este repositorio para evaluar prácticas de comandos de sistemas operativos.

## Configuración inicial

Para que los badges dinámicos funcionen correctamente, debes seguir estos pasos:

1. **Crear un GitHub Gist que almacenará los datos de los badges**
   - Ve a https://gist.github.com/
   - Crea un nuevo gist público o privado con tres archivos vacíos:
     - `comando_basico.json`
     - `redirecciones.json`
     - `pipes.json`
   - Puedes simplemente añadir archivos vacíos con esos nombres (el contenido no importa, será reemplazado)
   - Anota el ID del gist (parte de la URL después de tu nombre de usuario)
   - Ejemplo: Para un gist en `https://gist.github.com/luispri2001/1a2b3c4d5e6f7g8h9i0j`, el ID es `1a2b3c4d5e6f7g8h9i0j`

2. **Crear un token de acceso personal (PAT) en GitHub**
   - Ve a Settings -> Developer settings -> Personal access tokens -> Tokens (classic)
   - Haz clic en "Generate new token (classic)"
   - Asigna un nombre descriptivo como "Badge Updater"
   - Selecciona solo el permiso `gist`
   - Genera y copia el token generado (¡importante! no podrás verlo de nuevo)

3. **Agregar secrets al repositorio**
   - En tu repositorio, ve a Settings -> Secrets and variables -> Actions
   - Haz clic en "New repository secret"
   - Agrega dos secrets:
     - Nombre: `GIST_ID`, Valor: El ID del gist que creaste
     - Nombre: `GIST_SECRET`, Valor: El token de acceso personal que generaste

## Solución a errores comunes

### Error 404 al acceder al Gist

Si ves errores como:
```
Failed to get gist, response status code: 404, status message: Not Found
TypeError: Cannot read properties of undefined (reading 'comando_basico.json')
```

Posibles causas y soluciones:
1. **El GIST_ID es incorrecto**: Verifica que el ID del Gist sea exactamente el que aparece en la URL.
2. **El token no tiene permisos suficientes**: Asegúrate de que el token tenga permisos de `gist`.
3. **Los archivos no existen en el Gist**: Crea manualmente los archivos `comando_basico.json`, `redirecciones.json` y `pipes.json` en el Gist.
4. **El Gist es privado y el token no tiene acceso**: Si estás usando un Gist privado, asegúrate de que el token tenga acceso a tus Gists privados.

### Los badges no se actualizan

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
