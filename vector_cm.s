.syntax unified
.cpu cortex-m3

.org 0x0
.section .vectors
.align 6 /* vector table on SAM3X8E 46 entries, LM3S6965 has 58; align to 64 bytes */
.global vtable

vtable:
	.long _initsp
	.long _start
	.long
	.long hardfault_handler
	.long memmanage_handler
	.long busfault_handler
	.long usagefault_handler
	.long
	.long
	.long
	.long
	.long svcall_handler
	.long /* reserved for debug */
	.long
	.long pendsv_handler
	.long systick_handler

	/* IRQs follow */
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler
	.long irq_handler


.text
.thumb /* select thumb instructions */
.thumb_func /* next symbol is a thumb function */
.align 2
.global _start
.global reset_handler

_start:
reset_handler:
	/* choose another stack */

	ldr r0, =__eo_process_stack
	msr psp, r0

	/* select psp */
	ldr r1, =0x2
	msr control, r1
	b .

.align 2
.thumb_func
memmanage_handler:
hardfault_handler:
busfault_handler:
usagefault_handler:
svcall_handler:
pendsv_handler:
systick_handler:
	b .

.align 2
.thumb_func:
irq_handler:
	b .

.align 10
.section stack
.skip 1020, 0x55
.global __eo_process_stack
__eo_process_stack:


.org 0x20001c00
.skip 1020,0xaa
.global _initsp
_initsp:

.end
