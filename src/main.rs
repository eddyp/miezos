#![no_std]
#![feature(panic_implementation)]

use core::panic::PanicInfo;

/// Function called on panic
#[panic_implementation]
#[no_mangle]
pub fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

fn main() {
}
