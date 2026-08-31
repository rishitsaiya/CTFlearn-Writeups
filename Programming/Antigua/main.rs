
// https://en.wikipedia.org/wiki/Linear_congruential_generator
fn lincongruential(x: u32) -> u32 {
    let base: u32 = 2;
    let m:    u64 = base.pow(32);
    let a:    u64 = 1664525;
    let c:    u64 = 1013904223;
    let x64:  u64 = x as u64;
    let xnew: u64 = a*x64 + c;

    (xnew % m) as u32
    }

/// generate a vector of u32 values
fn get_u32_values() -> Vec<u32> {
    let verbose = false;
    let mut vec = Vec::new();

    let mut seed: u32 = 0xbaadf00d;
    if verbose {
        println!("Seed: {:#010x}", seed);
    }

    for n in 0..18 {
        seed = lincongruential(seed);
        if verbose {
            println!("{0:4}) {1:#010x}", n, seed);
        }
        vec.push(seed);
    }

    vec;
}

/// create a vector of u8 values
fn get_u8_values() -> () {
    let mut vec = Vec::new();

    vec.push(0x4e);
    vec.push(0xb5);
    vec.push(0x1f);
    vec.push(0xf4);
    vec.push(0xe8);
    vec.push(0xdb);
    vec.push(0x39);
    vec.push(0x3b);
    vec.push(0x9e);
    vec.push(0x1f);
    vec.push(0x53);
    vec.push(0x3a);
    vec.push(0x85);
    vec.push(0x97);
    vec.push(0xdf);
    vec.push(0xf1);
    vec.push(0x34);
    vec.push(0xae);

    vec
}

/// xor the low byte of each u32 value in v1 with the corresponding byte in v2
fn xor(v1: &Vec<u32>, v2: &Vec<u8> ) -> Vec<u8> {
    let mut vec = Vec::new();

    let size1 = v1.len();
    let size2 = v2.len();

    if size1 != size2 {
        panic!("Bad sizes in xor :-(");
    }

    for i in 0..size1 {
        let x = (v1[i] & 0xff ) as u8;
        let y = v2[i];
        let c = x ^ y;
        vec.push(c);

    }

    vec;
}

/// Convert a vector of u8 ascii values to the corresponding string
fn get_string(vec: &Vec<u8>) -> String {
    let mut s: String = String::new();

    for x in vec {
        s.push(*x);
    }

    s;
}

fn main() {
    println!("CTFlearn Rust Programming Challenge - 'Antigua'");
    println!("Fix the compile errors and run to find the flag.");
    println!("Good Luck!");
    println!("Ask questions on Discord: kcbowhunter#7248");


    let vec_u32 = get_u32_values();
    let vec_u8  = get_u8_values();
    let vec     = xor(vec_u32, vec_u8);
    let flag    = get_string(vec);
    println!("The flag is: CTFlearn{{{flag}}}");

    println!("All Done!");
}


// Each of these tests must pass
#[test]
fn test_lin_con01() {
    let seed: u32 = 0xbaadf00d;
    let x1 = lincongruential(seed);
    assert_eq!(x1, 0x762e5208);
}

#[test]
fn test_lin_con02() {
    let seed: u32 = 0x762e5208;
    let x1 = lincongruential(seed);
    assert_eq!(x1, 0xb4404dc7);
}

#[test]
fn test_get_u32_values() {
    let v = get_u32_values();

    assert_eq!(v.len(), 18);
    assert_eq!(v[0],  0x762e5208);
    assert_eq!(v[17], 0xb40f8fd7);
}

#[test]
fn test_get_u8_values() {
    let vec = get_u8_values();
    assert_eq!(vec.len(), 18);
    assert_eq!(vec[0], 0x4e);
    assert_eq!(vec[17], 0xae);
}

#[test]
fn test_xor() {
    let mut v1: Vec<u32> = Vec::new();
    let mut v2: Vec<u8>  = Vec::new();

    v1.push(0xab);
    v1.push(0xcd);
    v1.push(0x11);

    v2.push(0xff);
    v2.push(0xff);
    v2.push(0x22);

    let vec = xor(&v1, &v2);

    assert_eq!(vec[0], 0x54);
    assert_eq!(vec[1], 0x32);
    assert_eq!(vec[2], 0x33);
}

#[test]
fn test_get_string() {
    let mut vec = Vec::new();
    vec.push('H' as u8);
    vec.push('i' as u8);
    vec.push(' ' as u8);
    vec.push('M' as u8);
    vec.push('o' as u8);
    vec.push('m' as u8);

    let s = get_string(&vec);
    assert_eq!(s, "Hi Mom");
}