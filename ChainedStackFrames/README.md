# Chained Stack Frame Example

While argument passing via register is suitable for up to 8 64-bit integers (stored in x0-x7), short structures (>= 16-bytes), and floating point numbers, other cases must be passed via the stack.

This is called "chaining" as we chain a section, the outgoing parameter area, with the next stack frame.

To get an idea of how SEH handles chaining, we pass a structure larger than 16 bytes to a function and generate assembly with the SEH annotation with `clang -S`.