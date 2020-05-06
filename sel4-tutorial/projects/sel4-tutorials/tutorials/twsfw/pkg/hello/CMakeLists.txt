
cmake_minimum_required(VERSION 3.8.2)

project(hello C)

add_executable(hello hello.c)

target_link_libraries(hello -static)
