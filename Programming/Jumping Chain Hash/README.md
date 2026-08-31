## Jumping Chain Hash

The main idea is reversing a custom cipher (JCH) that grows a "left chain" and a "right chain" around an input block over several rounds, then using the chain contents to recover the original block.

#### Step-1:

Jim gives us his documentation for the Jumping Chain Hash (JCH), along with a ciphertext (his encrypted bitcoin password). The documentation walks through encrypting the string `'ctf'` step by step, and gives a few extra plaintext/ciphertext pairs (`pumpkin`, `bitcoin`, `ctflearn`) to test against.

The gist of JCH: for an `n`-letter block, it runs `n` rounds. Each round is either an *inner* jump or an *outer* jump, starting with inner and toggling every round. Each round adds one new letter (derived from each letter of the current block) to both the left chain and the right chain, then the block itself gets modified using the sum of the new letters just added.

#### Step-2:

Working through the `'ctf'` example carefully gives the exact rules for one round:

- **Inner jump**: for each letter in the block, subtract 1 (mod 26) and append it to the *end* of the left chain (in block order). For the right chain, add 1 (mod 26) to each letter, then prepend those letters *one at a time* to the front of the right chain — since each is prepended individually, the segment ends up reversed relative to the block order.
- **Outer jump**: the opposite. Add 1 (mod 26) to each block letter and prepend individually to the *front* of the left chain (again ending up reversed), and subtract 1 (mod 26) from each block letter and append to the *end* of the right chain (in block order, not reversed).
- **Block update**: after adding the new segment to each chain, sum the values of the new left segment and the new right segment, multiply the two sums together, then add that product (mod 26) to every letter currently in the block.

Since the ciphertext is just `left_chain + block + right_chain`, and every round adds exactly `n` letters to each chain, after `n` rounds:

```
len(ciphertext) = n (block) + n*n (left chain) + n*n (right chain) = n + 2*n^2
```

This lets us recover `n` directly from the ciphertext length by solving `2n^2 + n - L = 0`.

#### Step-3:

With the exact rules pinned down, encryption is straightforward to implement and can be checked against Jim's `'ctf'` example and the three additional test pairs he provided:

```python
def encrypt(s):
    n = len(s)
    block = [ord(c) - ord('a') for c in s]
    left, right = [], []

    for r in range(1, n + 1):
        inner = (r % 2 == 1)

        if inner:
            left_new = [(v - 1) % 26 for v in block]
            left = left + left_new
            right_new = [(v + 1) % 26 for v in block]
            right = list(reversed(right_new)) + right
        else:
            left_new = [(v + 1) % 26 for v in block]
            left = list(reversed(left_new)) + left
            right_new = [(v - 1) % 26 for v in block]
            right = right + right_new

        product = sum(left_new) * sum(right_new)
        block = [(v + product) % 26 for v in block]

    to_str = lambda vals: ''.join(chr(v + ord('a')) for v in vals)
    return to_str(left) + to_str(block) + to_str(right)
```

This reproduces every given plaintext/ciphertext pair exactly.

#### Step-4:

To decrypt, the process just needs to run backwards: peel `n` letters off the correct end of each chain for each round (starting from the last round and working back to round 1), use their sums to undo the block's modular addition, and repeat until the chains are empty and the block is back to its original value.

```python
def decrypt(enc):
    L = len(enc)
    n = int((-1 + math.isqrt(1 + 8 * L)) // 4)
    while n * (2 * n + 1) != L:
        n += 1

    vals = [ord(c) - ord('a') for c in enc]
    left = vals[0:n * n]
    block = vals[n * n:n * n + n]
    right = vals[n * n + n:n * n + n + n * n]

    for r in range(n, 0, -1):
        inner = (r % 2 == 1)

        if inner:
            left_new = left[-n:]
            left = left[:-n]
            right_new = list(reversed(right[:n]))
            right = right[n:]
        else:
            left_new = list(reversed(left[:n]))
            left = left[n:]
            right_new = right[-n:]
            right = right[:-n]

        product = sum(left_new) * sum(right_new)
        block = [(v - product) % 26 for v in block]

    return ''.join(chr(v + ord('a')) for v in block)
```

Running this against `'xlubsekbndugpdmgudsjv'` correctly returns `'ctf'`, and it round-trips correctly on `pumpkin`, `bitcoin`, and `ctflearn` too, so the reversal logic can be trusted on the real ciphertext.

#### Step-5:

Jim's encrypted password is 1485 characters long, which solves to `n = 27`. Feeding it into `decrypt()`:

```
password: theblockchainwillconsumeyou
```

#### Step-6:

Finally, Jim's bitcoin account password becomes: `theblockchainwillconsumeyou`