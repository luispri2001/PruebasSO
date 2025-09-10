# Instrucciones para Estudiantes

Este documento contiene instrucciones detalladas sobre cómo completar los ejercicios de comandos de sistemas operativos.

**Nota: Esta versión del repositorio incluye las soluciones completas como prueba de concepto para verificar que los tests funcionan correctamente. En un entorno de enseñanza real, las soluciones deberían estar en blanco para que los estudiantes las completen.**

## Preparación

1. Haz un fork de este repositorio haciendo clic en el botón "Fork" en la parte superior derecha de la página del repositorio.
2. Clona tu fork a tu máquina local:
   ```bash
   git clone https://github.com/TU_USUARIO/PruebasSO.git
   cd PruebasSO
   ```

## Completando los ejercicios

1. Los ejercicios se encuentran en la carpeta `ejercicios/`. Hay cuatro archivos:
   - `comandos_basicos.sh`: Ejercicios sobre comandos básicos de Linux
   - `redirecciones.sh`: Ejercicios sobre redirección de entrada/salida
   - `pipes.sh`: Ejercicios sobre el uso de tuberías (pipes)
   - `directory-info.sh`: Un script bash interactivo para mostrar información sobre directorios

2. Abre cada archivo y completa las soluciones:
   ```bash
   # Ejemplo:
   EJERCICIO_1="ls -la"
   ```

3. No modifiques ninguna otra parte del archivo que no sea la variable `EJERCICIO_X` en los tres primeros ejercicios. Para el ejercicio `directory-info.sh`, debes completar todo el script según las instrucciones.

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
   - Los badges en el README.md también mostrarán el estado de tus soluciones

## Consejos

- Recuerda que puedes usar la ayuda de los comandos con la opción `--help` o el comando `man`
- Puedes probar los comandos en tu terminal antes de escribirlos en los archivos de soluciones
- Si tienes problemas con un ejercicio, intenta buscar información sobre el comando específico en recursos como:
  - [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html)
  - [Linux Command Library](https://linuxcommandlibrary.com/)
  - [ExplainShell](https://explainshell.com/)
