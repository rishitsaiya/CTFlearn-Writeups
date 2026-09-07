## Christmas Tree Hash

The main idea is carefully reverse-engineering a seven-step, tree-based hash function from a worked example and several test cases, nailing down a couple of ambiguous details by brute-forcing which interpretation actually reproduces the documented numbers, then running the validated pipeline on the real input.

#### Step-1:

We're given two files: `text1.txt`, which documents the "Christmas Tree Hash" (CTH) with one fully worked example, a short note on handling multiple trees, and two extra test cases with known keys; and `text2.txt`, the real input — 8 tree roots followed by 6 branch rows.

The input format describes a tree per root in the first row, all sharing the same branch structure given by the rest of the rows. Every row after the first lists the children that get attached, in order, to *every* node in the row above it — so a small input can describe a surprisingly large tree. For the real input:

```
15  8  20  10  12  17  8  9      <- 8 roots (8 trees)
3   20 18  4   14  12  3         <- 7 children per root
9   16 11  18  18  16  7  19     <- 8 children per level-2 node
14  10 14  1   14  13  2  14     <- 8 children per level-3 node
2   15 14  11                    <- 4 children per level-4 node
16  8  18  20  2   3             <- 6 children per level-5 node
20  6  14  18  16  19            <- 6 children per level-6 node (leaves)
```

That works out to `1 + 7 + 56 + 448 + 1792 + 10752 + 64512 = 77,568` nodes per tree, across 8 trees — about 620,000 nodes total, all needing the full seven-step process.

#### Step-2:

Steps 1–3 of the algorithm are spelled out clearly enough to implement directly from the doc:

- **Step 1**: pre-order DFS the tree, pushing the running product onto a list *every time you visit a node* (not just at the leaves).
- **Step 2**: swap each adjacent pair in that list, then reverse the whole thing.
- **Step 3**: map each number to a letter via `n % 26`, and join into a string.

```python
def tree_products(root_value, branch_rows):
    products = []
    def dfs(value, depth):
        products.append(value)
        if depth < len(branch_rows):
            for child in branch_rows[depth]:
                dfs(value * child, depth + 1)
    dfs(root_value, 0)
    return products

def step2_swap_reverse(products):
    lst = products[:]
    for i in range(0, len(lst) - 1, 2):
        lst[i], lst[i + 1] = lst[i + 1], lst[i]
    return lst[::-1]

def step3_letters(nums):
    return "".join(chr(ord('a') + (n % 26)) for n in nums)
```

Running this on the worked example (`root=3`, branches `[2,5,7]` then `[3,4]`) reproduces the doc's product list, swapped/reversed list, and `"lgivptsydg"` string exactly.

#### Step-3:

Step 4 is where the doc gets vague — "convert this string into binary" doesn't say how many bits per character. ASCII (8-bit) doesn't reproduce the documented `a`/`b` bit strings, and neither does a raw 5-bit alphabet-index encoding. Brute-forcing a few encodings against the known values:

```python
a: 1101100110011111
b: 0111001001100111
```

...showed that **7-bit ASCII per character**, concatenated with no padding, reproduces both exactly (since every lowercase letter fits in 7 bits, the leading `0` that 8-bit encoding would add just isn't there):

```python
def step4_and16(s):
    bits = "".join(format(ord(c), "07b") for c in s)
    a = int(bits[:16], 2)
    b = int(bits[-16:], 2)
    return a & b
```

This gives `a & b = 20487`, matching the doc.

#### Step-4:

Step 5 was straightforward once Step 4 was right: split the AND result's digits into pairs (last one alone if odd), sum them, and that sum (as a string) is the tree's contribution to a combined multi-tree string:

```python
def step5_groups_sum(n):
    s = str(n)
    groups = [s[i:i + 2] for i in range(0, len(s), 2)]
    return sum(int(g) for g in groups)
```

`20487` → groups `20, 48, 7` → sum `75`, matching the doc's `Tree Result: '75'`.

#### Step-5:

Step 6 also had a snag: the doc's prose says to subtract `365^5 + 52^10 + 7^20 - 457981573849226022` from the combined value, but plugging that formula into the worked example gives the wrong number. Testing all four sign combinations against the documented `New Value: -682335424444623097` showed the real formula actually **adds** the trailing constant instead of subtracting it — which also matches the partial `exploit.py` snippet from the challenge:

```python
BIG_CONST = pow(365, 5) + pow(52, 10) + pow(7, 20) + 457981573849226022
new_value = int(combined) - BIG_CONST
```

#### Step-6:

Step 7 repeats the group-and-letter logic from Steps 5/3, but this time on the (possibly negative) new value. The key detail: the minus sign is treated as part of the string being grouped, which is what makes an 18-digit magnitude turn into a 10-character key instead of 9:

```python
def step7_key(new_value):
    s = str(new_value)
    groups = [s[i:i + 2] for i in range(0, len(s), 2)]
    return "".join(chr(ord('a') + (int(g) % 26)) for g in groups)
```

`-682335424444623097` → groups `-6, 82, 33, 54, 24, 44, 46, 23, 09, 7` → key `'uehcysuxjh'`, matching the doc exactly.

#### Step-7:

With every step pinned down, the full pipeline was checked against **all four** documented cases — the single-tree example, the two-tree example, and both "Additional Test Cases" (including one with a 9,000+ node tree) — and matched every one:

```
[OK ] got='uehcysuxjh' expected='uehcysuxjh'
[OK ] got='uehcyssogb' expected='uehcyssogb'
[OK ] got='udyqvcfgpe' expected='udyqvcfgpe'
[OK ] got='nzfclhiajxqa' expected='nzfclhiajxqa'
```

#### Step-8:

Running the same, fully-validated pipeline on the real 8-tree, 620,000-node input:

```
Real input combined: 689062131519290127
Real input new_value: 6726707074666955
KEY: password
```

#### Step-9:

Finally, the encryption key becomes: `password`