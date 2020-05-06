# TWSFW

#the host dependencies configuration 

https://docs.sel4.systems/projects/buildsystem/host-dependencies.html

#Get the code sel4-tutorials

mkdir sel4-tutorials-manifest

cd sel4-tutorials-manifest

repo init -u https://github.com/SEL4PROJ/sel4-tutorials-manifest

repo sync

#Combine folders sel4-tutorial and WSFW

#install VMware workstation

VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle

#install grub2 in linux-VM on VMware-workstation

#gedit 

#add the following menuentry in /grub2/grub.conf

menuentry 'seL4' --class fedora --class gnu-linux --class gnu --class os {
    load_video
    insmod gzio
    insmod part_msdos
    insmod ext2
    set root='(hd0,msdos1)'
    search --no-floppy --fs-uuid --set=root <deviceID>
    echo 'Loading seL4 kernel'
    multiboot /kernel-image-ia32-pc99
    echo 'Loading initial module ...'
    module /sel4-image-ia32-pc99
}

#install socat

sudo yum install socat

#install minicom

sudo yum instal minicom

#in sel4-tutorial/

rebuild_all.sh

bash replace_all.sh

#command line message

2020/05/06 10:37:13 socat[7585] N opening connection to AF=1 "/tmp/vsock0"

2020/05/06 10:37:13 socat[7585] N successfully connected from local address AF=1 

"\0\0\0\0\0\0\x@0\xAEv9\xEB"

2020/05/06 10:37:13 socat[7585] N PTY is [[[[ /dev/pts/2 ]]]]

2020/05/06 10:37:13 socat[7585] N starting data transfer loop with FDs [5,5] and [6,6]

#in an another command line console

minicom  -D  /dev/pts/2   -b  9600

#note that /dev/pts/2 in first console is equal in another one

#login information: user is root. password is root.

Welcome to minicom 2.6.2      
      
OPTIONS: I18n       
Compiled on Jun 10 2014, 03:20:53.      
Port /dev/pts/2, 10:37:13      
      
Press CTRL-A Z for help on special keys      
      
fffff801e09c000)      
IOMMU: Create VTD context table for PCI bus 0x7f (pptr=0xffffff801e09d000)      
IOMMU: Create VTD context table for PCI bus 0x80 (pptr=0xffffff801e09e000)      
IOMMU: Create VTD context table for PCI bus 0x81 (pptr=0xffffff801e09f000)      
IOMMU: Create VTD context table for PCI bus 0x82 (pptr=0xffffff801e0a0000)      
IOMMU: Create VTD context table for PCI bus 0x83 (pptr=0xffffff801e0a1000)      
IOMMU: Create VTD context table for PCI bus 0x84 (pptr=0xffffff801e0a2000)      
IOMMU: Create VTD context table for PCI bus 0x85 (pptr=0xffffff801e0a3000)      
IOMMU: Create VTD context table for PCI bus 0x86 (pptr=0xffffff801e0a4000)      
IOMMU: Create VTD context table for PCI bus 0x87 (pptr=0xffffff801e0a5000)      
IOMMU: Create VTD context table for PCI bus 0x88 (pptr=0xffffff801e0a6000)      
IOMMU: Create VTD context table for PCI bus 0x89 (pptr=0xffffff801e0a7000)      
IOMMU: Create VTD context table for PCI bus 0x8a (pptr=0xffffff801e0a8000)      
IOMMU: Create VTD context table for PCI bus 0x8b (pptr=0xffffff801e0a9000)      
IOMMU: Create VTD context table for PCI bus 0x8c (pptr=0xffffff801e0aa000)      
IOMMU: Create VTD context table for PCI bus 0x8d (pptr=0xffffff801e0ab000)      
IOMMU: Create VTD context table for PCI bus 0x8e (pptr=0xffffff801e0ac000)      
IOMMU: Create VTD context table for PCI bus 0x8f (pptr=0xffffff801e0ad000)      
IOMMU: Create VTD context table for PCI bus 0x90 (pptr=0xffffff801e0ae000)      
IOMMU: Create VTD context table for PCI bus 0x91 (pptr=0xffffff801e0af000)      
IOMMU: Create VTD context table for PCI bus 0x92 (pptr=0xffffff801e0b0000)      
IOMMU: Create VTD context table for PCI bus 0x93 (pptr=0xffffff801e0b1000)      
IOMMU: Create VTD context table for PCI bus 0x94 (pptr=0xffffff801e0b2000)      
IOMMU: Create VTD context table for PCI bus 0x95 (pptr=0xffffff801e0b3000)      
IOMMU: Create VTD context table for PCI bus 0x96 (pptr=0xffffff801e0b4000)      
IOMMU: Create VTD context table for PCI bus 0x97 (pptr=0xffffff801e0b5000)      
IOMMU: Create VTD context table for PCI bus 0x98 (pptr=0xffffff801e0b6000)      
IOMMU: Create VTD context table for PCI bus 0x99 (pptr=0xffffff801e0b7000)      
IOMMU: Create VTD context table for PCI bus 0x9a (pptr=0xffffff801e0b8000)      
IOMMU: Create VTD context table for PCI bus 0x9b (pptr=0xffffff801e0b9000)      
IOMMU: Create VTD context table for PCI bus 0x9c (pptr=0xffffff801e0ba000)      
IOMMU: Create VTD context table for PCI bus 0x9d (pptr=0xffffff801e0bb000)      
IOMMU: Create VTD context table for PCI bus 0x9e (pptr=0xffffff801e0bc000)      
IOMMU: Create VTD context table for PCI bus 0x9f (pptr=0xffffff801e0bd000)      
IOMMU: Create VTD context table for PCI bus 0xa0 (pptr=0xffffff801e0be000)      
IOMMU: Create VTD context table for PCI bus 0xa1 (pptr=0xffffff801e0bf000)      
IOMMU: Create VTD context table for PCI bus 0xa2 (pptr=0xffffff801e0c0000)      
IOMMU: Create VTD context table for PCI bus 0xa3 (pptr=0xffffff801e0c1000)      
IOMMU: Create VTD context table for PCI bus 0xa4 (pptr=0xffffff801e0c2000)      
IOMMU: Create VTD context table for PCI bus 0xa5 (pptr=0xffffff801e0c3000)      
IOMMU: Create VTD context table for PCI bus 0xa6 (pptr=0xffffff801e0c4000)      
IOMMU: Create VTD context table for PCI bus 0xa7 (pptr=0xffffff801e0c5000)      
IOMMU: Create VTD context table for PCI bus 0xa8 (pptr=0xffffff801e0c6000)      
IOMMU: Create VTD context table for PCI bus 0xa9 (pptr=0xffffff801e0c7000)      
IOMMU: Create VTD context table for PCI bus 0xaa (pptr=0xffffff801e0c8000)      
IOMMU: Create VTD context table for PCI bus 0xab (pptr=0xffffff801e0c9000)      
IOMMU: Create VTD context table for PCI bus 0xac (pptr=0xffffff801e0ca000)      
IOMMU: Create VTD context table for PCI bus 0xad (pptr=0xffffff801e0cb000)      
IOMMU: Create VTD context table for PCI bus 0xae (pptr=0xffffff801e0cc000)      
IOMMU: Create VTD context table for PCI bus 0xaf (pptr=0xffffff801e0cd000)      
IOMMU: Create VTD context table for PCI bus 0xb0 (pptr=0xffffff801e0ce000)      
IOMMU: Create VTD context table for PCI bus 0xb1 (pptr=0xffffff801e0cf000)      
IOMMU: Create VTD context table for PCI bus 0xb2 (pptr=0xffffff801e0d0000)      
IOMMU: Create VTD context table for PCI bus 0xb3 (pptr=0xffffff801e0d1000)      
IOMMU: Create VTD context table for PCI bus 0xb4 (pptr=0xffffff801e0d2000)      
IOMMU: Create VTD context table for PCI bus 0xb5 (pptr=0xffffff801e0d3000)      
IOMMU: Create VTD context table for PCI bus 0xb6 (pptr=0xffffff801e0d4000)      
IOMMU: Create VTD context table for PCI bus 0xb7 (pptr=0xffffff801e0d5000)      
IOMMU: Create VTD context table for PCI bus 0xb8 (pptr=0xffffff801e0d6000)      
IOMMU: Create VTD context table for PCI bus 0xb9 (pptr=0xffffff801e0d7000)      
IOMMU: Create VTD context table for PCI bus 0xba (pptr=0xffffff801e0d8000)      
IOMMU: Create VTD context table for PCI bus 0xbb (pptr=0xffffff801e0d9000)      
IOMMU: Create VTD context table for PCI bus 0xbc (pptr=0xffffff801e0da000)      
IOMMU: Create VTD context table for PCI bus 0xbd (pptr=0xffffff801e0db000)      
IOMMU: Create VTD context table for PCI bus 0xbe (pptr=0xffffff801e0dc000)      
IOMMU: Create VTD context table for PCI bus 0xbf (pptr=0xffffff801e0dd000)      
IOMMU: Create VTD context table for PCI bus 0xc0 (pptr=0xffffff801e0de000)      
IOMMU: Create VTD context table for PCI bus 0xc1 (pptr=0xffffff801e0df000)      
IOMMU: Create VTD context table for PCI bus 0xc2 (pptr=0xffffff801e0e0000)      
IOMMU: Create VTD context table for PCI bus 0xc3 (pptr=0xffffff801e0e1000)      
IOMMU: Create VTD context table for PCI bus 0xc4 (pptr=0xffffff801e0e2000)      
IOMMU: Create VTD context table for PCI bus 0xc5 (pptr=0xffffff801e0e3000)      
IOMMU: Create VTD context table for PCI bus 0xc6 (pptr=0xffffff801e0e4000)      
IOMMU: Create VTD context table for PCI bus 0xc7 (pptr=0xffffff801e0e5000)      
IOMMU: Create VTD context table for PCI bus 0xc8 (pptr=0xffffff801e0e6000)      
IOMMU: Create VTD context table for PCI bus 0xc9 (pptr=0xffffff801e0e7000)      
IOMMU: Create VTD context table for PCI bus 0xca (pptr=0xffffff801e0e8000)      
IOMMU: Create VTD context table for PCI bus 0xcb (pptr=0xffffff801e0e9000)      
IOMMU: Create VTD context table for PCI bus 0xcc (pptr=0xffffff801e0ea000)      
IOMMU: Create VTD context table for PCI bus 0xcd (pptr=0xffffff801e0eb000)      
IOMMU: Create VTD context table for PCI bus 0xce (pptr=0xffffff801e0ec000)      
IOMMU: Create VTD context table for PCI bus 0xcf (pptr=0xffffff801e0ed000)      
IOMMU: Create VTD context table for PCI bus 0xd0 (pptr=0xffffff801e0ee000)      
IOMMU: Create VTD context table for PCI bus 0xd1 (pptr=0xffffff801e0ef000)      
IOMMU: Create VTD context table for PCI bus 0xd2 (pptr=0xffffff801e0f0000)      
IOMMU: Create VTD context table for PCI bus 0xd3 (pptr=0xffffff801e0f1000)      
IOMMU: Create VTD context table for PCI bus 0xd4 (pptr=0xffffff801e0f2000)      
IOMMU: Create VTD context table for PCI bus 0xd5 (pptr=0xffffff801e0f3000)      
IOMMU: Create VTD context table for PCI bus 0xd6 (pptr=0xffffff801e0f4000)      
IOMMU: Create VTD context table for PCI bus 0xd7 (pptr=0xffffff801e0f5000)      
IOMMU: Create VTD context table for PCI bus 0xd8 (pptr=0xffffff801e0f6000)      
IOMMU: Create VTD context table for PCI bus 0xd9 (pptr=0xffffff801e0f7000)      
IOMMU: Create VTD context table for PCI bus 0xda (pptr=0xffffff801e0f8000)      
IOMMU: Create VTD context table for PCI bus 0xdb (pptr=0xffffff801e0f9000)      
IOMMU: Create VTD context table for PCI bus 0xdc (pptr=0xffffff801e0fa000)      
IOMMU: Create VTD context table for PCI bus 0xdd (pptr=0xffffff801e0fb000)      
IOMMU: Create VTD context table for PCI bus 0xde (pptr=0xffffff801e0fc000)      
IOMMU: Create VTD context table for PCI bus 0xdf (pptr=0xffffff801e0fd000)      
IOMMU: Create VTD context table for PCI bus 0xe0 (pptr=0xffffff801e0fe000)      
IOMMU: Create VTD context table for PCI bus 0xe1 (pptr=0xffffff801e0ff000)      
IOMMU: Create VTD context table for PCI bus 0xe2 (pptr=0xffffff801e100000)      
IOMMU: Create VTD context table for PCI bus 0xe3 (pptr=0xffffff801e101000)      
IOMMU: Create VTD context table for PCI bus 0xe4 (pptr=0xffffff801e102000)      
IOMMU: Create VTD context table for PCI bus 0xe5 (pptr=0xffffff801e103000)      
IOMMU: Create VTD context table for PCI bus 0xe6 (pptr=0xffffff801e104000)      
IOMMU: Create VTD context table for PCI bus 0xe7 (pptr=0xffffff801e105000)      
IOMMU: Create VTD context table for PCI bus 0xe8 (pptr=0xffffff801e106000)      
IOMMU: Create VTD context table for PCI bus 0xe9 (pptr=0xffffff801e107000)      
IOMMU: Create VTD context table for PCI bus 0xea (pptr=0xffffff801e108000)      
IOMMU: Create VTD context table for PCI bus 0xeb (pptr=0xffffff801e109000)      
IOMMU: Create VTD context table for PCI bus 0xec (pptr=0xffffff801e10a000)      
IOMMU: Create VTD context table for PCI bus 0xed (pptr=0xffffff801e10b000)      
IOMMU: Create VTD context table for PCI bus 0xee (pptr=0xffffff801e10c000)      
IOMMU: Create VTD context table for PCI bus 0xef (pptr=0xffffff801e10d000)      
IOMMU: Create VTD context table for PCI bus 0xf0 (pptr=0xffffff801e10e000)      
IOMMU: Create VTD context table for PCI bus 0xf1 (pptr=0xffffff801e10f000)      
IOMMU: Create VTD context table for PCI bus 0xf2 (pptr=0xffffff801e110000)      
IOMMU: Create VTD context table for PCI bus 0xf3 (pptr=0xffffff801e111000)      
IOMMU: Create VTD context table for PCI bus 0xf4 (pptr=0xffffff801e112000)      
IOMMU: Create VTD context table for PCI bus 0xf5 (pptr=0xffffff801e113000)      
IOMMU: Create VTD context table for PCI bus 0xf6 (pptr=0xffffff801e114000)      
IOMMU: Create VTD context table for PCI bus 0xf7 (pptr=0xffffff801e115000)      
IOMMU: Create VTD context table for PCI bus 0xf8 (pptr=0xffffff801e116000)      
IOMMU: Create VTD context table for PCI bus 0xf9 (pptr=0xffffff801e117000)      
IOMMU: Create VTD context table for PCI bus 0xfa (pptr=0xffffff801e118000)      
IOMMU: Create VTD context table for PCI bus 0xfb (pptr=0xffffff801e119000)      
IOMMU: Create VTD context table for PCI bus 0xfc (pptr=0xffffff801e11a000)      
IOMMU: Create VTD context table for PCI bus 0xfd (pptr=0xffffff801e11b000)      
IOMMU: Create VTD context table for PCI bus 0xfe (pptr=0xffffff801e11c000)      
IOMMU: Create VTD context table for PCI bus 0xff (pptr=0xffffff801e11d000)      
IOMMU 0x0: enabling... enabled                                                  
Booting all finished, dropped to user space                                     
<<seL4(CPU 0) [decodeUntypedInvocation/212 T0xffffff801e11e400 "rootserver" @40>
<<seL4(CPU 0) [decodeUntypedInvocation/212 T0xffffff801e11e400 "rootserver" @40>
Single bus detected                                                             
lib_pci_scan_dev found pci device 0 0                                           
PCI :: 00.00.00 : intel intel_82443bx_0 (vid 0x8086 did 0x7190) line0 pin0      
lib_pci_scan_dev found pci device 0 1                                           
PCI :: 00.01.00 : intel intel_82443bx_1 (vid 0x8086 did 0x7191) line0 pin0      
    BAR2 : [ io 0x40010100 sz 0x4 szmask 0xf8fffffc ]                           
    BAR3 : [ mem 0x2a000f0 sz 0x10 szmask 0x2a0f0f0   ]                         
    BAR4 : [ mem 0xfff0 sz 0x10 szmask 0xfff0fff0   ]                           
    BAR5 : [ mem 0xfff0 sz 0x10 szmask 0xfff0fff0   ]                           
lib_pci_scan_fun found additional bus 1 from 0 1 0                              
lib_pci_scan_dev found pci device 0 7                                           
PCI :: 00.07.00 : intel intel_82371ab_0 (vid 0x8086 did 0x7110) line0 pin0      
lib_pci_scan_dev found multi function device 0 7                                
PCI :: 00.07.01 : intel intel_82371ab (vid 0x8086 did 0x7111) line255 pin0      
    BAR4 : [ io 0x1060 sz 0x10 szmask 0xfffffff0 ]                              
PCI :: 00.07.03 : intel intel_82371ab_3 (vid 0x8086 did 0x7113) line0 pin0      
PCI :: 00.07.07 : vmware vmware_vmci_bus (vid 0x15ad did 0x740) line9 pin1      
    BAR0 : [ io 0x1080 sz 0x40 szmask 0xffffffc0 ]                              
    BAR1 : [ mem 0xfebfe000 sz 0x2000 szmask 0xffffe000 64bit  ]                
lib_pci_scan_dev found pci device 0 15                                          
PCI :: 00.0f.00 : vmware vmware_vsvga2 (vid 0x15ad did 0x405) line9 pin1        
    BAR0 : [ io 0x1070 sz 0x10 szmask 0xfffffff0 ]                              
    BAR1 : [ mem 0xe8000000 sz 0x8000000 szmask 0xf8000000  prefetch ]          
    BAR2 : [ mem 0xfe000000 sz 0x800000 szmask 0xff800000   ]                   
lib_pci_scan_dev found pci device 0 17                                          
PCI :: 00.11.00 : vmware vmware_pci_bridge (vid 0x15ad did 0x790) line255 pin0  
    BAR2 : [ io 0x44020200 sz 0x4 szmask 0xfffffffc ]                           
    BAR3 : [ mem 0x2803020 sz 0x10 szmask 0x280f0f0   ]                         
    BAR4 : [ mem 0xfdf0fd50 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe7f1e7b0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 2 from 0 17 0                             
lib_pci_scan_dev found pci device 2 0                                           
PCI :: 02.00.00 : intel Unknown device ID. (vid 0x8086 did 0x100f) line11 pin1  
    BAR0 : [ mem 0xfd5c0000 sz 0x20000 szmask 0xfffe0000 64bit  ]               
    BAR2 : [ mem 0xfdff0000 sz 0x10000 szmask 0xffff0000 64bit  ]               
    BAR4 : [ io 0x2000 sz 0x40 szmask 0xffffffc0 ]                              
lib_pci_scan_dev found pci device 2 1                                           
PCI :: 02.01.00 : ensoniq ensoniq_es1371 (vid 0x1274 did 0x1371) line10 pin1    
    BAR0 : [ io 0x2040 sz 0x40 szmask 0xffffffc0 ]                              
lib_pci_scan_dev found pci device 0 21                                          
PCI :: 00.15.00 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x30300 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0x4040 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfd40fd40 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe7a1e7a0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 3 from 0 21 0                             
lib_pci_scan_dev found multi function device 0 21                               
PCI :: 00.15.01 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x40400 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0x8080 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfd00fd00 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe761e760 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 4 from 0 21 1                             
PCI :: 00.15.02 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x50500 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xc0c0 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfcc0fcc0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe721e720 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 5 from 0 21 2                             
PCI :: 00.15.03 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x60600 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc80fc80 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6e1e6e0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 6 from 0 21 3                             
PCI :: 00.15.04 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x70700 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc40fc40 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6a1e6a0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 7 from 0 21 4                             
PCI :: 00.15.05 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x80800 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc00fc00 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe661e660 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 8 from 0 21 5                             
PCI :: 00.15.06 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x90900 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfbc0fbc0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe621e620 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 9 from 0 21 6                             
PCI :: 00.15.07 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xa0a00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfb80fb80 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe5e1e5e0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 10 from 0 21 7                            
lib_pci_scan_dev found pci device 0 22                                          
PCI :: 00.16.00 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xb0b00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0x5050 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfd30fd30 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe791e790 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 11 from 0 22 0                            
lib_pci_scan_dev found multi function device 0 22                               
PCI :: 00.16.01 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xc0c00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0x9090 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfcf0fcf0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe751e750 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 12 from 0 22 1                            
PCI :: 00.16.02 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xd0d00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xd0d0 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfcb0fcb0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe711e710 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 13 from 0 22 2                            
PCI :: 00.16.03 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xe0e00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc70fc70 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6d1e6d0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 14 from 0 22 3                            
PCI :: 00.16.04 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0xf0f00 sz 0x4 szmask 0xfffffc ]                                
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc30fc30 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe691e690 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 15 from 0 22 4                            
PCI :: 00.16.05 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x101000 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfbf0fbf0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe651e650 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 16 from 0 22 5                            
PCI :: 00.16.06 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x111100 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfbb0fbb0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe611e610 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 17 from 0 22 6                            
PCI :: 00.16.07 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x121200 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfb70fb70 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe5d1e5d0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 18 from 0 22 7                            
lib_pci_scan_dev found pci device 0 23                                          
PCI :: 00.17.00 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x131300 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0x6060 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfd20fd20 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe781e780 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 19 from 0 23 0                            
lib_pci_scan_dev found multi function device 0 23                               
PCI :: 00.17.01 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x141400 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xa0a0 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfce0fce0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe741e740 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 20 from 0 23 1                            
PCI :: 00.17.02 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x151500 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xe0e0 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfca0fca0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe701e700 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 21 from 0 23 2                            
PCI :: 00.17.03 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x161600 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc60fc60 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6c1e6c0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 22 from 0 23 3                            
PCI :: 00.17.04 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x171700 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc20fc20 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe681e680 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 23 from 0 23 4                            
PCI :: 00.17.05 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x181800 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfbe0fbe0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe641e640 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 24 from 0 23 5                            
PCI :: 00.17.06 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x191900 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfba0fba0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe601e600 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 25 from 0 23 6                            
PCI :: 00.17.07 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1a1a00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfb60fb60 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe5c1e5c0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 26 from 0 23 7                            
lib_pci_scan_dev found pci device 0 24                                          
PCI :: 00.18.00 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1b1b00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0x7070 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfd10fd10 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe771e770 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 27 from 0 24 0                            
lib_pci_scan_dev found multi function device 0 24                               
PCI :: 00.18.01 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1c1c00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xb0b0 sz 0x10 szmask 0xf0f0   ]                               
    BAR4 : [ mem 0xfcd0fcd0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe731e730 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 28 from 0 24 1                            
PCI :: 00.18.02 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1d1d00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc90fc90 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6f1e6f0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 29 from 0 24 2                            
PCI :: 00.18.03 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1e1e00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc50fc50 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe6b1e6b0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 30 from 0 24 3                            
PCI :: 00.18.04 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x1f1f00 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfc10fc10 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe671e670 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 31 from 0 24 4                            
PCI :: 00.18.05 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x202000 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfbd0fbd0 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe631e630 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 32 from 0 24 5                            
PCI :: 00.18.06 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x212100 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfb90fb90 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe5f1e5f0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 33 from 0 24 6                            
PCI :: 00.18.07 : vmware vmware_pci_expres (vid 0x15ad did 0x7a0) line255 pin0  
    BAR2 : [ io 0x222200 sz 0x4 szmask 0xfffffc ]                               
    BAR3 : [ mem 0xf0 sz 0x10 szmask 0xf0f0   ]                                 
    BAR4 : [ mem 0xfb50fb50 sz 0x10 szmask 0xfff0fff0   ]                       
    BAR5 : [ io 0xe5b1e5b0 sz 0x10 szmask 0xfff1fff0 ]                          
lib_pci_scan_fun found additional bus 34 from 0 24 7                            
Guest page dir allocated at 0x10000000. Creating 1-1 entries                    
sel4utils_reserve_range_at_no_alloc@vspace.c:601 Range not available at 0x7e00,0
vm_reserve_memory_at@guest_memory.c:334 Failed to allocate vm reservation: Unab2
vm_ram_register_at@guest_ram.c:361 Unable to reserve ram region at addr 0x7e00 0
guest_elf_relocate@guest_image.c:135     50000 relocs done.                     
guest_elf_relocate@guest_image.c:135     100000 relocs done.                    
Constructing guest cmdline at 0x500 of size 142                                 
Guest boot info allocated at 0x58f. Populating...                               
Final e820 map is:                                                              
        0x0 - 0x500 type 2                                                      
        0x500 - 0x7c00 type 1                                                   
        0x7c00 - 0x80000 type 2                                                 
        0x80000 - 0x9fc00 type 1                                                
        0x9fc00 - 0x10001000 type 2                                             
        0x10001000 - 0x18001000 type 1                                          
        0x18001000 - 0x0 type 2                                                 
Initializing guest to start running at 0x10400000                               
[    0.000000] Linux version 4.8.16 (alisonf@carbon) (gcc version 7.4.0 (Ubuntu9
[    0.000000] Disabled fast string operations                                  
[    0.000000] x86/fpu: Legacy x87 FPU detected.                                
[    0.000000] x86/fpu: Using 'eager' FPU context switches.                     
[    0.000000] e820: BIOS-provided physical RAM map:                            
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000004ff] reserved  
[    0.000000] BIOS-e820: [mem 0x0000000000000500-0x0000000000007bff] usable    
[    0.000000] BIOS-e820: [mem 0x0000000000007c00-0x000000000007ffff] reserved  
[    0.000000] BIOS-e820: [mem 0x0000000000080000-0x000000000009fbff] usable    
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x0000000010000fff] reserved  
[    0.000000] BIOS-e820: [mem 0x0000000010001000-0x0000000018000fff] usable    
[    0.000000] BIOS-e820: [mem 0x0000000018001000-0x00000000ffffffff] reserved  
[    0.000000] bootconsole [earlyser0] enabled                                  
[    0.000000] Notice: NX (Execute Disable) protection missing in CPU!          
[    0.000000] DMI not present or invalid.                                      
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved     
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable                  
[    0.000000] e820: last_pfn = 0x18001 max_arch_pfn = 0x100000                 
[    0.000000] MTRR: Disabled                                                   
[    0.000000] x86/PAT: MTRRs disabled, skipping PAT initialization too.        
[    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC     
[    0.000000] Scanning 1 areas for low memory corruption                       
[    0.000000] initial memory mapped: [mem 0x00000000-0x10ffffff]               
[    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384            
[    0.000000] BRK [0x10b8f000, 0x10b8ffff] PGTABLE                             
[    0.000000] BRK [0x10b90000, 0x10b90fff] PGTABLE                             
[    0.000000] RAMDISK: [mem 0x10c71000-0x11450fff]                             
[    0.000000] 384MB LOWMEM available.                                          
[    0.000000]   mapped low ram: 0 - 18001000                                   
[    0.000000]   low ram: 0 - 18001000                                          
[    0.000000] Zone ranges:                                                     
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]           
[    0.000000]   Normal   [mem 0x0000000001000000-0x0000000018000fff]           
[    0.000000] Movable zone start for each node                                 
[    0.000000] Early memory node ranges                                         
[    0.000000]   node   0: [mem 0x0000000000001000-0x0000000000006fff]          
[    0.000000]   node   0: [mem 0x0000000000080000-0x000000000009efff]          
[    0.000000]   node   0: [mem 0x0000000010001000-0x0000000018000fff]          
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000018000fff] 
[    0.000000] On node 0 totalpages: 32805                                      
[    0.000000] free_area_init_node: node 0, pgdat d0a7ce40, node_mem_map d7cdd00
[    0.000000]   DMA zone: 32 pages used for memmap                             
[    0.000000]   DMA zone: 0 pages reserved                                     
[    0.000000]   DMA zone: 37 pages, LIFO batch:0                               
[    0.000000]   Normal zone: 737 pages used for memmap                         
[    0.000000]   Normal zone: 32768 pages, LIFO batch:7                         
[    0.000000] e820: [mem 0x10000000-0x103fffff] available for PCI devices      
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xfffs
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768                    
[    0.000000] pcpu-alloc: [0] 0                                                
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pa6
[    0.000000] Kernel command line: earlyprintk=ttyS0,115200 console=ttyS0,1152m
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)              
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)   
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)     
[    0.000000] Initializing CPU#0                                               
[    0.000000] Memory: 112000K/131220K available (4590K kernel code, 339K rwdat)
[    0.000000] virtual kernel memory layout:                                    
[    0.000000]     fixmap  : 0xfffe4000 - 0xfffff000   ( 108 kB)                
[    0.000000]     vmalloc : 0xd8801000 - 0xfffe2000   ( 631 MB)                
[    0.000000]     lowmem  : 0xc0000000 - 0xd8001000   ( 384 MB)                
[    0.000000]       .init : 0xd0a88000 - 0xd0acf000   ( 284 kB)                
[    0.000000]       .data : 0xd087bcae - 0xd0a86d40   (2092 kB)                
[    0.000000]       .text : 0xd0400000 - 0xd087bcae   (4591 kB)                
[    0.000000] Checking if this processor honours the WP bit even in supervisor.
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1       
[    0.000000] NR_IRQS:16 nr_irqs:16 16                                         
[    0.000000] CPU 0 irqstacks, hard=d7808000 soft=d780a000                     
[    0.000000] Console: colour dummy device 80x25                               
[    0.000000] console [ttyS0] enabled                                          
[    0.000000] console [ttyS0] enabled                                          
[    0.000000] bootconsole [earlyser0] disabled                                 
[    0.000000] bootconsole [earlyser0] disabled                                 
[    0.000000] tsc: Unable to calibrate against PIT                             
[    0.000000] tsc: No reference (HPET/PMTIMER) available                       
[    0.000000] tsc: Marking TSC unstable due to could not calculate TSC khz     
[    0.030000] Calibrating delay loop... 7351.50 BogoMIPS (lpj=36757504)        
[    0.060000] pid_max: default: 32768 minimum: 301                             
[    0.060000] Security Framework initialized                                   
[    0.060000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)      
[    0.070000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes) 
[    0.070000] Disabled fast string operations                                  
[    0.080000] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 1024            
[    0.080000] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 1024, 1GB 4     
[    0.080000] CPU: Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz (family: 0x6, model)
[    0.100000] Performance Events: unsupported p6 CPU model 60 no PMU driver, s.
[    0.100000] devtmpfs: initialized                                            
[    0.100000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ms
[    0.110000] kworker/u2:0 (11) used greatest stack depth: 7196 bytes left     
[    0.120000] NET: Registered protocol family 16                               
[    0.120000] cpuidle: using governor ladder                                   
[    0.120000] cpuidle: using governor menu                                     
[    0.120000] clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_is
[    0.130000] PCI: Using configuration type 1 for base access                  
[    0.140000] vgaarb: loaded                                                   
[    0.140000] SCSI subsystem initialized                                       
[    0.140000] libata version 3.00 loaded.                                      
[    0.140000] usbcore: registered new interface driver usbfs                   
[    0.150000] usbcore: registered new interface driver hub                     
[    0.150000] usbcore: registered new device driver usb                        
[    0.150000] pps_core: LinuxPPS API ver. 1 registered                         
[    0.160000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giom>
[    0.160000] PTP clock support registered                                     
[    0.160000] dmi: Firmware registration failed.                               
[    0.170000] PCI: Probing PCI hardware                                        
[    0.170000] PCI: root bus 00: using default resources                        
[    0.170000] PCI: Probing PCI hardware (bus 00)                               
[    0.180000] PCI host bridge to bus 0000:00                                   
[    0.180000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]           
[    0.180000] pci_bus 0000:00: root bus resource [mem 0x00000000-0xffffffff]   
[    0.190000] pci_bus 0000:00: No busn resource found for root bus, will use []
[    0.190000] pci 0000:00:00.0: [5e14:0042] type 00 class 0x060000             
[    0.200000] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00      
[    0.200000] PCI: pci_cache_line_size set to 32 bytes                         
[    0.200000] e820: reserve RAM buffer [mem 0x00007c00-0x0000ffff]             
[    0.210000] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]             
[    0.210000] e820: reserve RAM buffer [mem 0x18001000-0x1bffffff]             
[    0.220000] NetLabel: Initializing                                           
[    0.220000] NetLabel:  domain hash size = 128                                
[    0.220000] NetLabel:  protocols = UNLABELED CIPSOv4                         
[    0.220000] NetLabel:  unlabeled traffic allowed by default                  
[    0.230000] clocksource: Switched to clocksource pit                         
[    0.230000] VFS: Disk quotas dquot_6.6.0                                     
[    0.230000] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)  
[    0.240468] hugetlbfs: disabling because there are no supported hugepage sizs
[    0.246973] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]                  
[    0.246973] pci_bus 0000:00: resource 5 [mem 0x00000000-0xffffffff]          
[    0.246973] NET: Registered protocol family 2                                
[    0.258099] TCP established hash table entries: 1024 (order: 0, 4096 bytes)  
[    0.258099] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)         
[    0.270948] TCP: Hash tables configured (established 1024 bind 1024)         
[    0.270948] UDP hash table entries: 256 (order: 0, 4096 bytes)               
[    0.278824] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)          
[    0.278824] NET: Registered protocol family 1                                
[    0.278824] RPC: Registered named UNIX socket transport module.              
[    0.289808] RPC: Registered udp transport module.                            
[    0.289808] RPC: Registered tcp transport module.                            
[    0.289808] RPC: Registered tcp NFSv4.1 backchannel transport module.        
[    0.300125] PCI: CLS 0 bytes, default 32                                     
[    0.300125] Unpacking initramfs...                                           
[    0.306959] Freeing initrd memory: 8064K (d0c71000 - d1451000)               
[    0.317999] platform rtc_cmos: registered platform RTC device (no PNP device)
[    0.317999] Scanning for low memory corruption every 60 seconds              
[    0.327327] futex hash table entries: 256 (order: -1, 3072 bytes)            
[    0.327327] workingset: timestamp_bits=30 max_order=15 bucket_order=0        
[    0.336964] squashfs: version 4.0 (2009/01/31) Phillip Lougher               
[    0.346972] NFS: Registering the id_resolver key type                        
[    0.346972] Key type id_resolver registered                                  
[    0.346972] Key type id_legacy registered                                    
[    0.356958] Block layer SCSI generic (bsg) driver version 0.4 loaded (major )
[    0.356958] io scheduler noop registered                                     
[    0.356958] io scheduler deadline registered                                 
[    0.367913] io scheduler cfq registered (default)                            
[    0.367913] intel_idle: does not run on family 6 model 60                    
[    0.367913] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled          
[    0.392997] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is A
[    0.398247] Non-volatile memory driver v1.3                                  
[    0.398247] [drm] Initialized drm 1.1.0 20060810                             
[    0.406969] loop: module loaded                                              
[    0.406969] pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend@alpha.franken.de   
[    0.406969] e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI            
[    0.418308] e100: Copyright(c) 1999-2006 Intel Corporation                   
[    0.418308] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI 
[    0.427587] e1000: Copyright (c) 1999-2006 Intel Corporation.                
[    0.427587] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k               
[    0.427587] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.              
[    0.438984] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.3.0-k  
[    0.438984] igb: Copyright (c) 2007-2014 Intel Corporation.                  
[    0.447003] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver       
[    0.447003] ehci-pci: EHCI PCI platform driver                               
[    0.447003] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver           
[    0.458760] ohci-pci: OHCI PCI platform driver                               
[    0.458760] uhci_hcd: USB Universal Host Controller Interface driver         
[    0.458760] usbcore: registered new interface driver usblp                   
[    0.469649] usbcore: registered new interface driver usb-storage             
[    0.469649] rtc_cmos rtc_cmos: rtc core: registered rtc_cmos as rtc0         
[    0.478300] rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram         
[    0.478300] i2c /dev entries driver                                          
[    0.478300] hidraw: raw HID events driver (C) Jiri Kosina                    
[    0.489413] usbcore: registered new interface driver usbhid                  
[    0.489413] usbhid: USB HID core driver                                      
[    0.497434] Netfilter messages via NETLINK v0.30.                            
[    0.497434] nf_conntrack version 0.5.0 (2048 buckets, 8192 max)              
[    0.497434] ctnetlink v0.93: registering with nfnetlink.                     
[    0.507882] ip_tables: (C) 2000-2006 Netfilter Core Team                     
[    0.507882] Initializing XFRM netlink socket                                 
[    0.507882] NET: Registered protocol family 10                               
[    0.517531] ip6_tables: (C) 2000-2006 Netfilter Core Team                    
[    0.517531] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver              
[    0.517531] NET: Registered protocol family 17                               
[    0.528158] RPC: Registered rdma transport module.                           
[    0.528158] RPC: Registered rdma backchannel transport module.               
[    0.528158] Key type dns_resolver registered                                 
[    0.537936] microcode: sig=0x306c3, pf=0x1, revision=0x1                     
[    0.537936] microcode: Microcode Update Driver: v2.01 <tigran@aivazian.fsneta
[    0.547151] registered taskstats version 1                                   
[    0.547151] console [netcon0] enabled                                        
[    0.547151] netconsole: network logging started                              
[    0.547151] Freeing unused kernel memory: 284K (d0a88000 - d0acf000)         
[    0.559865] Write protecting the kernel text: 4592k                          
[    0.559865] Write protecting the kernel read-only data: 1752k                
[    0.566966] poke: loading out-of-tree module taints kernel.                  
[    0.566966] poke: module license 'unspecified' taints kernel.                
[    0.566966] Disabling lock debugging due to kernel taint                     
[    0.578465] poke initialized with major number 246                           
[    0.578465] initialized                                                      
[    0.578465] Trust Worthy System: Char device twsfw_file is registered with m0
[    0.589153] Trust Worthy System: To communicate to the device, use: mknod tw0
[    0.589153] insmod (649) used greatest stack depth: 7188 bytes left          
[    0.598766] mount (651) used greatest stack depth: 7180 bytes left           
Starting logging: OK                                                            
[    0.606967] S01logging (658) used greatest stack depth: 7144 bytes left      
Initializing ran[    0.606967] random: dd: uninitialized urandom read (512 byte)
dom number generator... done.                                                   
Starting network[    0.619048] wait_iface (675) used greatest stack depth: 7136t
: [    0.630044] ip (677) used greatest stack depth: 6728 bytes left            
OK                                                                              
Failed to locate device consumes_event.                                         
Failed to locate device emits_event.                                            
                                                                                
Welcome to Buildroot                                                            
buildroot login: [    2.737213] random: fast init done  

#create file for communication

mknod twsfw_file c 100 0

#add a rule

twsfw -a -i -s 192.168.1.2 -d 192.168.1.4 -m 255.255.0.0 -n 255.255.0.0 -p 443 -q 23 -c 6 


#list the rules

twsfw view


