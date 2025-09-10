# Instrucciones para Estudiantes

Este documento contiene instrucciones detalladas sobre cómo completar los ejercicios de comandos básicos de sistemas operativos.

**Nota: Esta versión del repositorio incluye las soluciones completas como prueba de concepto para verificar que los tests funcionan correctamente. En un entorno de enseñanza real, las soluciones deberían estar en blanco para que los estudiantes las completen.**

## Preparación

1. Haz un fork de este repositorio haciendo clic en el botón "Fork" en la parte superior derecha de la página del repositorio.
2. Clona tu fork a tu máquina local:
   ```bash
   git clone https://github.com/TU_USUARIO/PruebasSO.git
   cd PruebasSO
   ```

## Completando los ejercicios

1. El ejercicio se encuentra en el archivo `ejercicios/comandos_basicos.sh`.

2. Abre el archivo y completa las soluciones:
   ```bash
   # Ejemplo:
   EJERCICIO_1="ls -la"
   ```

3. No modifiques ninguna otra parte del archivo que no sea la variable `EJERCICIO_X`.

## Enviando tus soluciones

1. Guarda tus cambios:
   ```bash
   git add ejercicios/comandos_basicos.sh
   git commit -m "Completar ejercicios de comandos básicos"
   git push
   ```

2. Verifica el estado de tus soluciones:
   - Ve a la pestaña "Actions" en tu repositorio de GitHub
   - Verás el estado de las pruebas automáticas
   - Descarga el artefacto "test-results" para ver un resumen detallado de tus resultados

## Visualización de resultados

Después de que los tests se hayan ejecutado en GitHub Actions, podrás ver los resultados de dos formas:

1. **En los logs de GitHub Actions**: Al final de la ejecución del workflow, se mostrará un resumen de los resultados de los tests.

2. **Como artefacto descargable**: Los resultados se guardan como un archivo Markdown que puedes descargar desde la página de Actions.

   ![Ejemplo de Artefacto](https://docs.github.com/assets/cb-25896/mw-1440/images/help/actions/artifact-download-link.webp)

## Ejercicios

El archivo `comandos_basicos.sh` contiene 5 ejercicios:

1. Comando para listar todos los archivos (incluyendo ocultos) en formato largo
2. Comando para crear un directorio llamado "mi_carpeta"
3. Comando para mostrar el directorio actual de trabajo
4. Comando para cambiar los permisos de un archivo llamado "archivo.txt" para que sea ejecutable por el usuario
5. Comando para mostrar las primeras 5 líneas de un archivo llamado "datos.txt"

## Consejos

- Recuerda que puedes usar la ayuda de los comandos con la opción `--help` o el comando `man`
- Puedes probar los comandos en tu terminal antes de escribirlos en los archivos de soluciones
- Si tienes problemas con un ejercicio, intenta buscar información sobre el comando específico en recursos como:
  - [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html)
  - [Linux Command Library](https://linuxcommandlibrary.com/)
  - [ExplainShell](https://explainshell.com/)

## Probando tus soluciones localmente

Puedes probar tus soluciones localmente antes de subirlas:

```bash
# Dar permisos de ejecución a los scripts de prueba y al script directory-info.sh
chmod +x ./tests/*.sh
chmod +x ./ejercicios/directory-info.sh

# Ejecutar los tests individualmente
./tests/test_comandos_basicos.sh
./tests/test_redirecciones.sh
./tests/test_pipes.sh
./tests/test_directory_info.sh

# También puedes probar los tests basados en salida (más flexibles)
./tests/test_comandos_basicos_output.sh
./tests/test_redirecciones_output.sh
./tests/test_pipes_output.sh
```

## Enviando tus soluciones

1. Guarda tus cambios:
   ```bash
   git add ejercicios/
   git commit -m "Completar ejercicios"
   git push
   ```

## Ejercicio de Shell Scripting (directory-info.sh)

El ejercicio `directory-info.sh` consiste en crear un script bash interactivo que muestre información sobre un directorio. El script debe:

1. Aceptar un argumento opcional que especifique la ruta del directorio a analizar:
   - Si no se proporciona ningún argumento, se usará el directorio actual (`.`)
   - Si se proporciona un argumento, debe ser un directorio válido
   - Si se proporcionan más de un argumento, el script debe mostrar un error

2. Mostrar un menú interactivo con las siguientes opciones:
   - Total disk used
   - Number of directories
   - Number of regular files
   - Biggest file
   - Smallest file
   - Number of files with read permission for the owner
   - Number of files with write permission for the group
   - Number of files with execution permission for the rest of users
   - Number of files with execution permission for everyone
   - Exit

3. Implementar cada opción como una función separada que utilice los comandos apropiados para obtener la información solicitada.

4. Permitir al usuario seleccionar opciones repetidamente hasta que elija salir.

Para probar este script:
```bash
# Dar permisos de ejecución
chmod +x ./ejercicios/directory-info.sh

# Ejecutar sin argumentos (analiza el directorio actual)
./ejercicios/directory-info.sh

# Ejecutar con un directorio específico
./ejercicios/directory-info.sh /ruta/a/un/directorio
```

2. Verifica el estado de tus soluciones:
   - Ve a la pestaña "Actions" en tu repositorio de GitHub
   - Verás el estado de las pruebas automáticas
   - Descarga el artefacto "test-results" para ver un resumen detallado de tus resultados

## Visualización de resultados

Después de que los tests se hayan ejecutado en GitHub Actions, podrás ver los resultados de dos formas:

1. **En los logs de GitHub Actions**: Al final de la ejecución del workflow, se mostrará un resumen de los resultados de los tests.

2. **Como artefacto descargable**: Los resultados se guardan como un archivo Markdown que puedes descargar desde la página de Actions.

   ![Ejemplo de Artefacto](https://docs.github.com/assets/cb-25896/mw-1440/images/help/actions/artifact-download-link.webp)

## Consejos

- Recuerda que puedes usar la ayuda de los comandos con la opción `--help` o el comando `man`
- Puedes probar los comandos en tu terminal antes de escribirlos en los archivos de soluciones
- Si tienes problemas con un ejercicio, intenta buscar información sobre el comando específico en recursos como:
  - [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html)
  - [Linux Command Library](https://linuxcommandlibrary.com/)
  - [ExplainShell](https://explainshell.com/)
