# Proyecto de ejemplo en C

Este ambiente esta preparado para correr y ejecutar su código

## Compilar
### En terminal
Abra la terminal en VS Code (Menu > Terminal > New Terminal) y ejecute:
```bash
clang -m32 -masm=intel -fms-extensions -O0 -fno-pic -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector <nombreArchivo> -o <nombreEjecutable>
```

## Ejecutar
### Con terminal
**LUEGO DE COMPILAR** ejecute su programa con:
```bash
./<nombreEjecutable>
```

