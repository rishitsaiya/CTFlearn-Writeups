## Antigua

We are given a single Rust source file `main.rs` that doesn't compile. The challenge tells us to fix the compile errors and run it to find the flag, and that there are unit tests included which must pass without modification.

#### Step-1:

Looking at `main.rs`, the program is meant to build a 32-bit linear congruential generator (LCG), XOR the low byte of each generated value against a hardcoded byte array, and turn the result into the flag string. `main` looks like this:

```rust
let vec_u32 = get_u32_values();
let vec_u8  = get_u8_values();
let vec     = xor(vec_u32, vec_u8);
let flag    = get_string(vec);
println!("The flag is: CTFlearn{{{flag}}}");
```

Running `cargo test` / `rustc` on the file as given produces several compile errors, since a few functions have their signatures, return types, or return values wrong.

#### Step-2:

Going error by error:

1. **`lincongruential`** – `let m: u64 = base.pow(32);` fails because `base` is a `u32`, so `base.pow(32)` returns a `u32`, not the `u64` the variable is annotated with. Fixed by casting first: `(base as u64).pow(32)`.

2. **`get_u32_values`** – the function is declared to return `Vec<u32>`, but the last line is `vec;` with a trailing semicolon. In Rust that turns the final expression into a statement, so the function actually returns `()` instead of the vector. Removing the semicolon (`vec`) fixes it.

3. **`get_u8_values`** – the function signature says `-> ()`, but it builds and needs to return a `Vec<u8>` (confirmed by `test_get_u8_values`, which checks its length and contents). Fixed the signature to `-> Vec<u8>`.

4. **`xor`** – same trailing-semicolon bug as `get_u32_values`: the last line was `vec;` instead of `vec`, so nothing was returned.

5. **`get_string`** – two bugs here. `s.push(*x)` doesn't compile because `String::push` takes a `char`, not a `u8`, so it needs `s.push(*x as char)`. It also had the same trailing-semicolon return bug (`s;` → `s`).

6. **`main`** – `xor` and `get_string` take references (`&Vec<u32>`, `&Vec<u8>`), but `main` was calling them with owned values: `xor(vec_u32, vec_u8)` and `get_string(vec)`. Fixed to `xor(&vec_u32, &vec_u8)` and `get_string(&vec)`.

None of the unit tests needed to change — they were already written against the correct signatures/behaviour, which is what made them useful for checking each fix.

#### Step-3:

With those fixes in place, the file compiles cleanly and all 6 provided tests pass:

```
running 6 tests
test test_get_string ... ok
test test_get_u32_values ... ok
test test_get_u8_values ... ok
test test_lin_con01 ... ok
test test_lin_con02 ... ok
test test_xor ... ok

test result: ok. 6 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Running the compiled program:

```
CTFlearn Rust Programming Challenge - 'Antigua'
Fix the compile errors and run to find the flag.
Good Luck!
Ask questions on Discord: kcbowhunter#7248
The flag is: CTFlearn{FreeT0wn.P1cadilly}
All Done!
```

#### Step-4:

Finally, the flag becomes: `CTFlearn{FreeT0wn.P1cadilly}`