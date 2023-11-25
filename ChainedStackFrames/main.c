#include <stdint.h>

struct largeStruct {
    uint64_t a;
    uint64_t b;
    uint64_t c;
}; // 24-bit size

void func(struct largeStruct l) {
    l.a = 5;
}

int main() {
    struct largeStruct l = {0};

    func(l);
    return 0;
}