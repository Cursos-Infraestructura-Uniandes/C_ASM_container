# C_ASM_container

Bienvenido al curso de **Tecnologías e Infraestructura de Cómputo**.

En este repositorio encontrará el ambiente de desarrollo contenerizado con un compilador de C/ASM en arquitectura de 32 bits, la cual será utilizada durante el curso. Este entorno le permitirá replicar y ejecutar **localmente** el mismo ambiente de desarrollo que se entrega durante el laboratorio, garantizando así la compatibilidad y uniformidad en las prácticas.

Para utilizarlo es necesario tener instaladas las siguientes herramientas:

- Docker 🐳 

En el caso de contar con un computador windows, recomendamos utilizar Docker sobre WSL2. 

## Nota importante

Los archivos que usted cree dentro de este ambiente de desarrollo se almacenarán dentro del contenedor. Siempre mantenga una copia o un respaldo (backup) de sus archivos en su máquina local. **La perdida de archivos no será una excusa válida para entregas tarde.**

## Despliegue y uso del contenedor

### Despliegue

Para desplegar el contenedor (una vez tenga instalado docker) debe:

1. Clone este repositorio en su computadora.
2. En su terminal, dirijase al directorio donde clonó el repositorio (puede utilizar el comando cd \<rutaRepositorio\> para este fin).
3. Construir la imagen de docker:

    ```bash
    docker build -t c-dev-env .
    ```

    Este proceso puede tardar algunos minutos mientras se descargan las dependencias necesarias para el contenedor. Sea paciente mientras se realiza la instalación.

4. Instanciar el contenedor

    ```bash
    docker run --rm -p 8080:8080 -p 2222:22 c-dev-env
    ```
### Uso en interfaz web

Dirijase a su navegador de preferencia y podrá utilizar el ambiente de desarrollo en la siguiente url http://localhost:8080 

La contraseña por defecto se encuentra en el dockerfile y es "123456".

### Uso con VS code local


También es posible conectarse al servidor de VS code del contenedor desde su VSCode local de dos maneras: 
1. Conexión por SSH
    * Puede conectarse de la misma forma que en el laboratorio cambiando la IP por ```localhost``` y el puerto a ```2222```.
    * Si requiere más detalles sobre la conexión puede revisar [la guía del laboratorio](https://github.com/Cursos-Infraestructura-Uniandes/C_ASM_container/wiki/Preparar-conexi%C3%B3n-a-ambiente-de-desarrollo). 

2. Utilizando la extensión "Dev Containers":
    * Abra la paleta de comandos ("F1" o "⌘+Shift+P") seleccionando ```"Dev Containers: Attach to Running Container..."``` 
    * En la lista, aparecerá su contenedor con el tag de la imagen (por ejemplo ```c-dev-env```). Selecciónelo para conectarse.
    * Desde la interfaz gráfica también puede usar la vista Remote Explorer (barra de actividades → pestaña Dev Containers). Ahí debería ver su contenedor y podrá usar la opción Attach to Container.
    * Una vez conectado, utilice Open Folder y seleccione la carpeta work, donde encontrará el ejemplo base.
    
    conectandose por SSH al igual que en el laboratorio cambiando la IP por su localhost y el puerto 2222.




