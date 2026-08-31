## Ten Thousand Hours

The main idea is recognizing that a huge, deliberately unreadable obfuscation script is just a long chain of small, individually reversible operations, and reversing them all in one pass instead of by hand.

#### Step-1:

We're given two files: `mucho_encrypto.py` and `super_encrypted`.

`mucho_encrypto.py` is a ~40,000 line Python script. It starts with:

```python
flag = [ord(i) for i in 'REDACTED']
k = len(flag)
```

...followed by 5,000 tiny, randomly-named functions (`cmul_8facd3c6`, `chsub_59843fee`, `shuffle_2cab1c5d`, `digsub_ee047607`, etc.), each taking the list `x` and returning a transformed version of it. After all the definitions, the file ends with 25,000 lines that just chain these functions together:

```python
flag = cmul_18dd5479(flag)
flag = cxor_9e4b96f2(flag)
flag = xor_214fe10e(flag)
...
flag = [str(j) for j in flag]
open("super_encrypted", "w").write("\n".join(flag))
```

`super_encrypted` is 36 lines, each one a huge integer (thousands of digits long) — the final state of the list after all 25,000 transformations.

#### Step-2:

Reading through a sample of the function bodies shows every function falls into one of a small number of categories (the prefix of the function name is a strong hint):

- `cmul` / `cadd` / `csub` / `cxor` — multiply/add/subtract/XOR every element by the *same* constant.
- `mul` / `add` / `sub` / `xor` — multiply/add/subtract/XOR each element by its own constant, taken from a fixed list.
- `chmul` / `chadd` / `chsub` / `chxor` — same idea, but the per-element constants come from `ord()` of characters in a hardcoded hex-looking string.
- `chunk` — rotate the whole list (`x[n:] + x[:n]`).
- `deck` — split the list into a few contiguous chunks and reorder them.
- `shuffle` — apply an explicit permutation (`x[p] for p in [...]`).
- `digsub` — treat each *number* as a string and substitute its digits (except the first) through a fixed 10-character mapping.

Crucially, every arithmetic function only ever applies **one** operation to each element — never a combination — and every permutation-style function is a pure rearrangement with no arithmetic. That means each of the 5,000 functions is trivially invertible on its own; the only real difficulty is doing this for 25,000 chained calls without transcribing everything by hand.

#### Step-3:

Rather than parsing each function category by regex and writing a bespoke inverter for each one, we used a small trick: run every function once on a list of "tracer" objects instead of real numbers. A `Track` object remembers its original index and records whichever single operation (`add`, `sub`, `mul`, `xor`) gets applied to it:

```python
class Track:
    def __init__(self, idx):
        self.idx, self.op, self.const = idx, None, None
    def _set(self, op, const):
        self.op, self.const = op, const
        return self
    def __add__(self, other): return self._set("add", other)
    def __sub__(self, other): return self._set("sub", other)
    def __mul__(self, other): return self._set("mul", other)
    def __xor__(self, other): return self._set("xor", other)
    __radd__ = __add__; __rmul__ = __mul__; __rxor__ = __xor__
```

Feeding `[Track(0), Track(1), ..., Track(35)]` into any function (shuffle, chunk, deck, or any arithmetic function) and reading the output tells us exactly, for every output position, which input position it came from and what single operation (if any) was applied to get there — regardless of what category the function actually is. That's enough information to invert *any* of these functions generically, with no manual case-by-case parsing needed.

`digsub` functions are the one exception, since they operate on the string form of a real number rather than doing simple arithmetic. For those we just pulled the 10-character substitution table straight out of the source with a regex and built the inverse digit mapping directly.

#### Step-4:

With generic inversion in place, the solve script:

1. Parses all 5,000 function definitions and the ordered list of 25,000 calls out of `mucho_encrypto.py`.
2. Traces each unique function once (caching the result, since many of the 5,000 functions are reused multiple times across the 25,000 calls) to build its inversion "spec".
3. Loads the 36 big integers from `super_encrypted`.
4. Walks the 25,000-call sequence **backwards**, applying each function's inverse to unwind one step at a time.
5. Converts the final 36 recovered values back to characters with `chr()`.

```python
current = [int(x) for x in cipher_lines]
for name in reversed(calls):
    current = invert_step(name, current)

flag = "".join(chr(v) for v in current)
```

#### Step-5:

Running the script fully unwinds all 25,000 transformations and lands on 36 clean, printable ASCII values:

```
recovered ord values: [102, 108, 97, 103, 123, 114, 51, 110, 100, 111, 109, 108, 121, 95, 103, 51, 110, 101, 114, 97, 116, 51, 100, 95, 109, 51, 116, 104, 48, 100, 83, 95, 70, 84, 87, 125]
FLAG: flag{r3ndomly_g3nerat3d_m3th0dS_FTW}
```

Turns out the "ten thousand hours" of work the boss's obfuscation software put in didn't matter — every step it took was still individually reversible, and a generic tracer beat reading 40,000 lines of code by hand.

#### Step-6:

Finally, the flag becomes: `flag{r3ndomly_g3nerat3d_m3th0dS_FTW}`