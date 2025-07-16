# C_ASM_container

Bienvenido al curso de Tecnologías e Infraestructura de Cómputo.

En este repositorio encontrará un ambiente de desarrollo contenerizado con un compilador de C/ASM en arquitectura de 32 bits (la cual será utilizada durante el curso). Para utilizarlo es necesario tener instaladas las siguientes herramientas:

- Docker 🐳 

En el caso de contar con un computador windows, recomendamos utilizar Docker sobre WSL2. 

## Nota importante

Los archivos que usted cree dentro de este ambiente de desarrollo serán creados dentro del contenedor, siempre tenga a la mano una copia o un backup de sus archivos. **La perdida de archivos no será una excusa válida para entregas tarde.**

## Despliegue y uso del contenedor

### Despliegue

Para desplegar el contenedor (una vez tenga instalado docker) debe:

1. Clone este repositorio en su computadora.
2. En su terminal dirijase al directorio donde clonó el repositorio.
3. Construir la imagen de docker:

    ```bash
    docker build -t c-dev-env .
    ```

    Este proceso puede tardar algunos minutos mientras se descargan las dependencias necesarias para el contenedor. Sea paciente mientras se realiza la instalación.

4. Instanciar el contenedor

    ```bash
    docker run --rm -p 8080:8080 c-dev-env
    ```
### Uso en interfaz web

Dirijase a su navegador de preferencia y podrá utilizar el ambiente de desarrollo en la siguiente url http://localhost:8080

### Uso con VS code local

Es posible conectarse al servidor de VS code del contenedor desde su VSCode local utilizando la extensión "Dev Containers". 

Para realizar la conexión puede seleccionar desde la paleta de comandos ("F1" o "⌘+Shift+P") seleccionando "Dev Containers: Attach to Running Container..." donde aparecerá su contenedor con el tag de la imagen (si siguió el ejemplo "c-dev-env").

Desde la interfaz gráfica puede usar la vista "Remote Explorer" desde la barra de actividades de VS Code. En esta pestaña dentro de la vista "Dev containers" debería ver su contenedor con el tag de la imagen asignado. Seleccione la inline action "Attach to Container" para conectarse.

Al abrirse la ventana nueva utilice "Open Folder" y seleccione la carpeta "projects" donde encontrará el ejemplo base.
