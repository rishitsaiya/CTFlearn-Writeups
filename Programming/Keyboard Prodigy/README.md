## A Musical Prodigy

The main idea is mapping note names (including their enharmonic spellings) to a common pitch-class representation, then checking each 8-note sequence against every possible major-scale root.

#### Step-1:

We're given a short music-theory excerpt (`text1.txt`) and Nozart's actual note log (`text2.txt`) — 10,000 lines, each with 8 tab-separated notes:

```
Fb	E	F	G#	Eb	B#	G#	B#
F	A#	A#	D	E	A#	D	C
Db	F	D	A#	C#	Cb	D	A
...
```

The doc explains that a major scale is 8 notes following the interval pattern *tone, tone, semitone, tone, tone, tone, semitone* (in semitones: `2, 2, 1, 2, 2, 2, 1`), and that the input notes may be shuffled and/or respelled with sharps/flats that land on the same actual pitch (`E#` is the same key as `F`, `Cb` is the same key as `B`, etc.).

#### Step-2:

Since only the actual pitch matters (not the note name), every note reduces to a **pitch class** 0–11 using the standard letter-to-semitone mapping, with `#` adding one semitone and `b` subtracting one, both mod 12:

```python
BASE = {"C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11}

def note_to_pc(note):
    letter, mod = note[0], note[1:]
    val = BASE[letter]
    if mod == "#":
        val += 1
    elif mod == "b":
        val -= 1
    return val % 12
```

This correctly folds the odd spellings from the doc's own example (`E# G A B# Fb B# D Cb`) onto the same pitch classes as the plain `C D E F G A B C` scale.

#### Step-3:

An 8-note major scale always has exactly 7 *distinct* pitch classes, since the first and last note are the same pitch class an octave apart (e.g. `C D E F G A B C`). So instead of checking order at all, a sequence is a valid major scale if its multiset of 8 pitch classes matches — for **some** root — the root doubled plus the six other scale degrees at `+2, +4, +5, +7, +9, +11` semitones:

```python
def is_major_scale(notes):
    pcs = [note_to_pc(n) for n in notes]
    counts = {}
    for p in pcs:
        counts[p] = counts.get(p, 0) + 1

    offsets = [0, 2, 4, 5, 7, 9, 11]
    for root in range(12):
        expected = {}
        for off in offsets:
            pc = (root + off) % 12
            expected[pc] = expected.get(pc, 0) + 1
        expected[root] = expected.get(root, 0) + 1  # root is doubled
        if expected == counts:
            return True
    return False
```

This sidesteps the "notes may be shuffled" complication entirely — order never mattered in the first place, only which 8 pitch classes (with one repeat) show up.

#### Step-4:

Before trusting it on the real data, this was checked against all 10 of the doc's "Additional Test Cases" (5 valid, 5 invalid), plus the three worked examples in the main text (the in-order scale, the shuffled version, and the sharps/flats version) — every one came back correct:

```
[OK] valid case: 'E# G# B Gb D# Db Gb Bb' -> True
[OK] valid case: 'F Bb Eb G G# C Db Ab' -> True
[OK] valid case: 'Fb Ab C# Bb D# B Gb Cb' -> True
[OK] valid case: 'G E# A B# Bb Eb D A#' -> True
[OK] valid case: 'G# B# G F C# Ab Bb Eb' -> True
[OK] invalid case: 'A G F# G B# Gb Gb Ab' -> False
[OK] invalid case: 'Eb D G A# E# Gb Bb A' -> False
[OK] invalid case: 'D# C# D B Bb Cb Eb E#' -> False
[OK] invalid case: 'Ab Fb D F Eb Bb G D#' -> False
[OK] invalid case: 'C G# Cb G# E# C D A#' -> False
```

#### Step-5:

Running the validated checker over all 10,000 real sequences:

```
total sequences: 10000
valid major scale count: 276
```

#### Step-6:

Finally, the answer becomes: `276`