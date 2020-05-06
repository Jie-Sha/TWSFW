    #include<stdio.h>
    #include<stdlib.h>
    #include<unistd.h>
    #include<sys/io.h>
    #define PCI_MAX_BUS 255
    #define PCI_MAX_DEV 31
    #define PCI_MAX_FUN 7
    #define PCI_BASE_ADDR 0x80000000L
    #define CONFIG_ADDR 0xcf8
    #define CONFIG_DATA 0xcfc
    typedef unsigned long DWORD;
    typedef unsigned int WORD;
    int main()
    {
        WORD bus, dev, fun;
        DWORD addr, data;
        printf("\nbus#\tdev#\tfun#\tvendor#\t\tdevice#\n");
        if ( iopl(3) < 0 )
        {
            printf("iopl set error\n");
            return -1;
        }
        for (bus = 0; bus <= PCI_MAX_BUS; bus++)
            for (dev = 0; dev <= PCI_MAX_DEV; dev++)
                for (fun = 0; fun <= PCI_MAX_FUN; fun++)
                {
                    addr = PCI_BASE_ADDR | (bus << 16) | (dev << 11) | (fun << 8);
                    outl(addr, CONFIG_ADDR);
                    data = inl(CONFIG_DATA);
                    if (((data & 0xFFFF) != 0xFFFF) && (data != 0))
                    {
                        // bus, dev, fun
                        printf("%02d  \t%02d  \t%02d  \t", bus, dev, fun);
                        // vendorID、deviceID
                        printf("%04x  \t\t%04x", (data & 0xFFFF), (data & 0xFFFF0000) >> 16);
                        printf("\n--------------------------------------------\n");
                    }
                }
        if (iopl(0) < 0 )
        {
            printf("iopl set error\n");
            return -1;
        }
        return 0;
    }
