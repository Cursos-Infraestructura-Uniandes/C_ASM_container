#include <stdio.h>

// Ejemplo usando inline assembly de Microsoft (dialect __asm)
int main() {
    int a = 10;
    int b = 20;
    int result = 0;
    
    printf("Compilando con Clang usando MSVC ABI\n");
    printf("a = %d, b = %d\n", a, b);
    
    // Inline assembly usando sintaxis de Microsoft
    #ifdef _MSC_VER
    __asm {
        mov eax, a
        add eax, b
        mov result, eax
    }
    #else
    // Alternativa para GCC/Clang en modo no-MSVC
    __asm__ __volatile__ (
        "movl %1, %%eax\n\t"
        "addl %2, %%eax\n\t"
        "movl %%eax, %0"
        : "=m" (result)
        : "m" (a), "m" (b)
        : "eax"
    );
    #endif
    
    printf("Resultado de la suma (usando assembly): %d\n", result);
    
    return 0;
}
