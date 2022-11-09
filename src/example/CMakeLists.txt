cmake_minimum_required(VERSION 3.18)
project(example C)

set(CMAKE_C_STANDARD 99)

add_library(example SHARED library.c)
