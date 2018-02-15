#include <stdio.h>

void rk4_(float*, float*);

void solveRungeKutta(float* t, float* y) {
    rk4_(t, y);
}