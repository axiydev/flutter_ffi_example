#include "library.h"
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdlib.h>
int addUsingC(int a,int b) {
   return a+b;
}

char *get_hello_from_c() {
    char *forecast = "hello from c";
    char *forecast_m = malloc(strlen(forecast));
    strcpy(forecast_m, forecast);
    return forecast_m;
}
