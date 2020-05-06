#!/usr/bin/env python3

import sys
import argparse
import logging
import os
import sh
import tempfile


def main():
	
	
	print("-------arg-start--------")
	args= ['-G', 'Ninja', '-DTUT_BOARD=pc', '-DTUT_ARCH=x86_64', '-DFORCE_IOMMU=ON', '-DTUTORIAL_DIR=camkes-vm-linuxrufxliqq', '-C', '../projects/sel4-tutorials/settings.cmake']
	tute_directory='/host/sel4-tutorial/camkes-vm-linuxrufxliqq'
	directory='/host/sel4-tutorial/camkes-vm-linuxrufxliqq_build'
	output="<_io.TextIOWrapper name='<stdout>' mode='w' encoding='UTF-8'>"
	print(args )
	print([tute_directory])
	#print(sh.ls("-l", "/tmp", color="never"))
	#print(sh.ls("-l", _cwd="/usr/local", color="never"))
	print(sh.cmake(args + [tute_directory], _cwd=directory))
	print("-------arg-end----------")

if __name__ == '__main__':
	sys.exit(main())
