
cmake_minimum_required(VERSION 3.8.2)

project(twsfw C)

add_executable(twsfw twsfw.c)

target_link_libraries(twsfw -static)
