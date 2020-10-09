PWD := $(shell pwd)

# This specifies the kernel module to be compiled
obj-m += get_dt_data.o

# The default action
all: modules

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
	
clean:
	rm -rf *.o 
	
.PHONY: modules modules_install clean
