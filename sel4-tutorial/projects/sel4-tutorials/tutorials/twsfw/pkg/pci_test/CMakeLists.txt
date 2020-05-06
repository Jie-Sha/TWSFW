
cmake_minimum_required(VERSION 3.8.2)

project(pci_test C)

add_executable(pci_test main.c)

target_link_libraries(pci_test -static)
