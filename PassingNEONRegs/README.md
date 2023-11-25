## Passing NEON q0-q15 registers to a function with intrinsics

As we spill q0-q7 in objc_msgSend, when performing a slow lookup, we need to find the correct annotation for annotating the loading, and storing of pairs of NEON registers.