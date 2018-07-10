miezos.elf:
	arm-none-eabi-gcc -g -nostartfiles vector_cm.s -o $@

debug-qemu:
	qemu-system-arm -machine lm3s6965evb -S -gdb tcp::1234 -kernel miezos.elf &
	gdb-multiarch -x miezos.gdbinit miezos.elf
