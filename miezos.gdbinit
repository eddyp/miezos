target remote :1234 | qemu-system-arm -machine lm3s6965evb -S -s -kernel miezos.elf
set $pc=reset_handler
tui enable
tui reg all
