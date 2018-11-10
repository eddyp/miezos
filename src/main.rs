#![no_std]
#![feature(panic_implementation)]
#![feature(start)]
//#![no_main]

use core::panic::PanicInfo;

/// Function called on panic
#[panic_implementation]
#[no_mangle]
pub fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[start(main)]
fn main(isize:argc, *const *const argv:u8) -> isize {
    loop {}
}
