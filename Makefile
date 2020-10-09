KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

# This specifies the kernel module to be compiled
obj-m += get_dt_data.o

# The default action
all: modules

user:
	$(MAKE) -C user

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
	
clean:
	rm -rf *.o 
	$(MAKE) -C user clean
	
.PHONY: modules modules_install user clean
