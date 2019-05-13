TARGET := arm-none-eabi
CC_TYPE := gcc

ifeq ($(CC_TYPE),gcc)
CC := $(TARGET)-gcc
endif
ifeq ($(CC_TYPE),clang)
CC := clang --target=$(TARGET)
endif

CC_OPT :=
ifneq ($(MIEZOS_DEBUG),no)
CC_OPT := -g
endif
ifeq ($(MIEZOS_OPTMZ),s)
CC_OPT += -Os -nostdlib
endif
LD_OPT = -nostartfiles -Wl,-Map,$(subst .elf,.map,$@)

PRJ := miezos
ELF := $(PRJ).elf

.PHONY: debug-qemu

$(ELF):
	$(CC) $(CC_OPT) $(LD_OPT) vector_cm.s -o $@

debug-qemu:
	qemu-system-arm -machine lm3s6965evb -S -gdb tcp::1234 -kernel $(ELF) &
	gdb-multiarch -x $(PRJ).gdbinit $(ELF)

.PHONY: clean
clean:
	rm -f *.o $(ELF)
