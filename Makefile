ifndef KERNEL_DIR
$(error KERNEL_DIR must be set in the command line)
endif
PWD := $(shell pwd)
ARCH ?= arm
CROSS_COMPILE ?= arm-poky-linux-gnueabi-

# This specifies the kernel module to be compiled
obj-m += get_dt_data.o

# The default action
all: modules

modules_install:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules_install


# The main tasks
modules clean:
	$(MAKE) -C $(KERNEL_DIR) \
            ARCH=$(ARCH) \
            CROSS_COMPILE=$(CROSS_COMPILE) \
            SUBDIRS=$(PWD) $@
