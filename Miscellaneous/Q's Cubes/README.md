## Q's Cubes

The main idea is to reproduce Q's physical folding process on the supplied square of cubes, following the alternating fold directions until all cubes form a single pillar, then interpret the resulting data as hexadecimal and decode it to ASCII. The provided example and 2×2/8×8 test cases make it possible to validate the folding order before running it against the real input.

#### Step-1:

We're given two files: `q.txt`, which contains the challenge description, the folding rules, a worked 4×4 example, and additional test cases; and `q2.txt`, which contains the actual 16×16 input to solve.

The challenge explains that Q starts with the cubes laid out as a flat square and folds them repeatedly until they form a single pillar. The folds are performed **North to South**, followed by **West to East**, and this pattern continues until only one stack remains. The final pillar is then read from top to bottom.

The example given in the challenge is:

```text
ABCD
EFGH
IJKL
MNOP
```

The documented result of folding this example is:

```text
OCBNJFGKLHEIMADP
```

This example is useful because it gives us an expected ordering against which we can test the implementation.

#### Step-2:

The first fold is **North to South**, meaning the top half of the square is folded over the bottom half.

Conceptually, for:

```text
ABCD
EFGH
IJKL
MNOP
```

the upper two rows are folded onto the lower two rows.

Because the cubes are physically being folded rather than simply removed, their ordering is reversed when they are placed on top of the other half.

After this operation, the square has half as many rows.

#### Step-3:

The next fold is **West to East**.

The left half of the current arrangement is folded over the right half. Again, the ordering of the folded portion has to be reversed to preserve the physical order of the cubes.

After this fold, the dimensions have been reduced by half in both directions.

The process therefore alternates:

```text
North -> South
West  -> East
North -> South
West  -> East
...
```

#### Step-4:

The important observation is that every fold halves the dimensions of the current square.

For the 16×16 challenge input, the folding therefore looks like:

```text
16 × 16
   ↓
  8 × 8
   ↓
  4 × 4
   ↓
  2 × 2
   ↓
  1 × 1
```

At the end, every cube has been folded into the same position, forming a single pillar.

The order of the cubes in that pillar is the encoded message.

#### Step-5:

The challenge provides a small test case to verify the folding implementation:

```text
12
34
```

The expected raw output is:

```text
3124
```

This is useful for checking the direction and reversal rules before attempting the larger input.

The challenge also provides an 8×8 test case:

```text
ABCDEFGH
IJKLMNOP
QRSTUVWX
YZabcdef
ghijklmn
opqrstuv
wxyz0123
456789?!
```

with expected output:

```text
?GB5hZemldai6CF91NKyqSVtuWRpxJO23PIwoQXvsUTrzLM08ED7jbcknfYg4AH!
```

Matching these test cases confirms that the folding order is being reproduced correctly.

#### Step-6:

Now we apply the same folding process to the real input in `q2.txt`.

The input is a 16×16 grid:

```text
7606477756078692
21607C2563207F74
9633860256D67726
64272F696D69656D
0216320236472736
672079666D65556C
F247064606E7F656
607521606274656C
122706926706C6F6
6065277328696966
46022796F6260616
2069602079756271
97060697F6671686
696F61206961656E
06C2320727073627
662F70627122664E
```

The values are made up of hexadecimal characters (`0-9` and `A-F`), which is a strong indication that the final pillar should be interpreted as a hexadecimal-encoded message.

#### Step-7:

Rather than manually performing the folds, `exploit.py` implements the process.

The script repeatedly folds the current grid until only one element remains:

```python
while len(grid) > 1:
    grid = fold(grid)
```

The `fold()` function performs the two required operations:

1. Fold the upper half onto the lower half.
2. Fold the left half onto the right half.

The relevant ordering is reversed during each fold to account for the physical orientation of the cubes.

The complete solver is provided in:

```text
exploit.py
```

#### Step-8:

Once the 16×16 grid has been reduced to a single pillar, we extract the resulting encoded string.

The final orientation means that the resulting value needs to be reversed before decoding:

```python
encoded = grid[0][0][::-1]
```

At this point, the data is hexadecimal.

The challenge hint is:

> Q has been playing Baseball for 16 years

The reference to **16** points toward **base 16**, i.e. hexadecimal.

Therefore, the resulting string can be converted from hexadecimal to ASCII using:

```python
binascii.unhexlify(encoded).decode()
```

#### Step-9:

The decoded plaintext is:

```text
If origami is the art of paper folding, maybe cubigami is the art of cube folding? Perhaps you should try cubigami as your flag.
```

The message tells us to try `cubigami` as the flag.

However, CTFlearn's accepted flag for this challenge is:

```text
CTFlearn{h4ck3d}
```

#### Step-10:

The final flag is: `CTFlearn{h4ck3d}`
