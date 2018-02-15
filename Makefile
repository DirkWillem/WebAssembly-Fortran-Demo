export PATH := bin:$(PATH)

RK4=rk4.o rk4_interface.o

clean:
	rm -f *.bc *.o *.ll *.s *.js *.wasm

rk4.js: $(RK4)
	emcc -o $@ $(RK4) -s EXPORTED_FUNCTIONS="['_solveRungeKutta']" -s WASM=1 -s MODULARIZE=1

%.o: %.c
	emcc -c $<

%.o: %.f90
	emgf $<

.PHONY.: clean