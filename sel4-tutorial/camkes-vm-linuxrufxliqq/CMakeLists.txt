
include(${SEL4_TUTORIALS_DIR}/settings.cmake)
sel4_tutorials_regenerate_tutorial(${CMAKE_CURRENT_SOURCE_DIR})

cmake_minimum_required(VERSION 3.8.2)

project(vm-app C ASM)
include(ExternalProject)
find_package(camkes-vm REQUIRED)
include(${CAMKES_VM_SETTINGS_PATH})
camkes_x86_vm_setup_x86_vm_environment()
include(${CAMKES_VM_HELPERS_PATH})
find_package(camkes-vm-linux REQUIRED)
include(${CAMKES_VM_LINUX_HELPERS_PATH})

include(simulation)
GenerateSimulateScript()


# Include CAmkES VM helper functions
include(${CAMKES_VM_LINUX_SOURCE_HELPERS_PATH})


# Setup Linux Sources
GetDefaultLinuxMajor(linux_major)
GetDefaultLinuxMinor(linux_minor)
GetDefaultLinuxMd5(linux_md5)
# Download and Configure our Linux sources
DownloadLinux(${linux_major} ${linux_minor} ${linux_md5} vm_linux_extract_dir download_vm_linux)
set(linux_config "${CAMKES_VM_LINUX_DIR}/linux_configs/${linux_major}.${linux_minor}/config")
set(linux_symvers "${CAMKES_VM_LINUX_DIR}/linux_configs/${linux_major}.${linux_minor}/Module.symvers")
ConfigureLinux(${vm_linux_extract_dir} ${linux_config} ${linux_symvers} configure_vm_linux
    DEPENDS download_vm_linux
)
# Add the external poke module project
ExternalProject_Add(poke-module
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/modules
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/poke-module
    BUILD_ALWAYS ON
    STAMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/poke-module-stamp
    EXCLUDE_FROM_ALL
    INSTALL_COMMAND ""
    DEPENDS download_vm_linux configure_vm_linux
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_TOOLCHAIN_FILE=${LINUX_32BIT_TOOLCHAIN}
        -DLINUX_KERNEL_DIR=${vm_linux_extract_dir}
        -DMODULE_HELPERS_FILE=${CAMKES_VM_LINUX_DIR}/linux-module-helpers.cmake
)
# Add our module binary to the overlay
AddExternalProjFilesToOverlay(poke-module ${CMAKE_CURRENT_BINARY_DIR}/poke-module vm-overlay "lib/modules/4.8.16/kernel/drivers/vmm"
    FILES poke.ko)

# Add the external twsfw module project
ExternalProject_Add(twsfw-module
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/modules
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/twsfw-module
    BUILD_ALWAYS ON
    STAMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/twsfw-module-stamp
    EXCLUDE_FROM_ALL
    INSTALL_COMMAND ""
    DEPENDS download_vm_linux configure_vm_linux
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_TOOLCHAIN_FILE=${LINUX_32BIT_TOOLCHAIN}
        -DLINUX_KERNEL_DIR=${vm_linux_extract_dir}
        -DMODULE_HELPERS_FILE=${CAMKES_VM_LINUX_DIR}/linux-module-helpers.cmake
)
# Add our module binary to the overlay
AddExternalProjFilesToOverlay(twsfw-module ${CMAKE_CURRENT_BINARY_DIR}/twsfw-module vm-overlay "lib/modules/4.8.16/kernel/drivers/vmm"
    FILES twsfw.ko)

AddFileToOverlayDir("init" ${CMAKE_CURRENT_LIST_DIR}/init "." vm-overlay)

#AddFileToOverlayDir("iperf.bin" ${CMAKE_CURRENT_LIST_DIR}/iperf.bin "." vm-overlay)

AddFileToOverlayDir("load100.sh" ${CMAKE_CURRENT_LIST_DIR}/load100.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load200.sh" ${CMAKE_CURRENT_LIST_DIR}/load200.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load300.sh" ${CMAKE_CURRENT_LIST_DIR}/load300.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load400.sh" ${CMAKE_CURRENT_LIST_DIR}/load400.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load500.sh" ${CMAKE_CURRENT_LIST_DIR}/load500.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load600.sh" ${CMAKE_CURRENT_LIST_DIR}/load600.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load700.sh" ${CMAKE_CURRENT_LIST_DIR}/load700.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load800.sh" ${CMAKE_CURRENT_LIST_DIR}/load800.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load900.sh" ${CMAKE_CURRENT_LIST_DIR}/load900.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)
AddFileToOverlayDir("load1000.sh" ${CMAKE_CURRENT_LIST_DIR}/load1000.sh "lib/modules/4.8.16/kernel/drivers/vmm" vm-overlay)

# Declare VM component: Init0
DeclareCAmkESVM(Init0)

# Get Default Linux VM files
GetDefaultLinuxKernelFile(default_kernel_file)
GetDefaultLinuxRootfsFile(default_rootfs_file)


# Decompress Linux Kernel image and add to file server
DecompressLinuxKernel(extract_linux_kernel decompressed_kernel ${default_kernel_file})

AddToFileServer("bzimage" ${decompressed_kernel} DEPENDS extract_linux_kernel)


# Get Custom toolchain for 32 bit Linux
include(cross_compiling)
FindCustomPollyToolchain(LINUX_32BIT_TOOLCHAIN "linux-gcc-32bit-pic")
# Declare our twsfw app external project
ExternalProject_Add(twsfw-app
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/pkg/twsfw
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/twsfw-app
    BUILD_ALWAYS ON
    STAMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/twsfw-app-stamp
    EXCLUDE_FROM_ALL
    INSTALL_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_TOOLCHAIN_FILE=${LINUX_32BIT_TOOLCHAIN}
)
# Add the twsfw world app to our overlay ('vm-overlay')
AddExternalProjFilesToOverlay(twsfw-app ${CMAKE_CURRENT_BINARY_DIR}/twsfw-app vm-overlay "usr/sbin"
    FILES twsfw)

# Declare our pci_test app external project
ExternalProject_Add(pci_test-app
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/pkg/pci_test
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/pci_test-app
    BUILD_ALWAYS ON
    STAMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/pci_test-app-stamp
    EXCLUDE_FROM_ALL
    INSTALL_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_TOOLCHAIN_FILE=${LINUX_32BIT_TOOLCHAIN}
)
# Add the pci_test world app to our overlay ('vm-overlay')
AddExternalProjFilesToOverlay(pci_test-app ${CMAKE_CURRENT_BINARY_DIR}/pci_test-app vm-overlay "usr/sbin"
    FILES pci_test)

# Add the overlay directory to our default rootfs image
AddOverlayDirToRootfs(vm-overlay ${default_rootfs_file} "buildroot" "rootfs_install"
    rootfs_file rootfs_target)
# Add rootfs images into file server
# default ${default_rootfs_file}
AddToFileServer("rootfs.cpio" ${rootfs_file} DEPENDS rootfs_target)



# Initialise CAmkES Root Server with addition CPP includes
DeclareCAmkESVMRootServer(vm_tutorial.camkes)
GenerateCAmkESRootserver()

