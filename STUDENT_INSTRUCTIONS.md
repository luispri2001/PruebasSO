# Instrucciones para Estudiantes

Este documento contiene instrucciones detalladas sobre cómo completar los ejercicios de comandos de sistemas operativos.

## Preparación

1. Haz un fork de este repositorio haciendo clic en el botón "Fork" en la parte superior derecha de la página del repositorio.
2. Clona tu fork a tu máquina local:
   ```bash
   git clone https://github.com/TU_USUARIO/PruebasSO.git
   cd PruebasSO
   ```

## Completando los ejercicios

1. Los ejercicios se encuentran en la carpeta `ejercicios/`. Hay tres archivos:
   - `comandos_basicos.sh`: Ejercicios sobre comandos básicos de Linux
   - `redirecciones.sh`: Ejercicios sobre redirección de entrada/salida
   - `pipes.sh`: Ejercicios sobre el uso de tuberías (pipes)

2. Abre cada archivo y completa las soluciones:
   ```bash
   # Ejemplo:
   EJERCICIO_1="ls -la"
   ```

3. No modifiques ninguna otra parte del archivo que no sea la variable `EJERCICIO_X`.

## Probando tus soluciones localmente

Puedes probar tus soluciones localmente antes de subirlas:

```bash
# Dar permisos de ejecución a los scripts de prueba
chmod +x ./tests/*.sh

# Ejecutar los tests individualmente
./tests/test_comandos_basicos.sh
./tests/test_redirecciones.sh
./tests/test_pipes.sh
```

## Enviando tus soluciones

1. Guarda tus cambios:
   ```bash
   git add ejercicios/
   git commit -m "Completar ejercicios"
   git push
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
