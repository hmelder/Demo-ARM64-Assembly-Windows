#include <stdio.h>
#include <windows.h>


int main() {
    __try {
        RaiseException(EXCEPTION_INT_DIVIDE_BY_ZERO, 0, 0, NULL);
    }
     __except(EXCEPTION_EXECUTE_HANDLER) {
        printf("Caught an exception in __except block.\n");
    }
    printf("After __try-__except block.\n");
    return 0;
}