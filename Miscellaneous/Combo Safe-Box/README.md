# README.md
## Combo Safe-box

The main idea to find the flag is following the hyperlinks embedded in a PowerPoint file to find the single non-looping path through a maze of "digit" slides.

#### Step-1:

The link shared was a Mega.nz file that turned out to be a `.pptx` — `Combo_Safe-box.pptx`. My friend's hint was:

```
Follow the links down the rabbit-hole! There's only one correct path!
```

That's a strong clue that this isn't a normal slideshow — each slide is a combination-lock "digit pad" (buttons `1`–`9`, `0`), and each button is a hyperlink to another slide. Most paths loop you back into a trap or dump you on a "fail" slide; only one sequence of digits reaches the "success" slide.

#### Step-2:

Since PowerPoint hides all of this behind click-through hyperlinks, I unzipped the `.pptx` (it's just a zip) to read the raw XML instead of clicking through by hand:

```
unzip Combo_Safe-box.pptx -d unzipped
```

Each slide's hyperlinks live in `ppt/slides/_rels/slideN.xml.rels`, and the button-to-digit mapping lives in `ppt/slides/slideN.xml`. So for every slide I extracted:

- the visible text on each button (the digit label)
- the `r:id` of that button's `hlinkClick`
- what slide that `r:id` resolves to, via the matching `.rels` file

#### Step-3:

Running that extraction across all 15 slides gave a full digit → destination-slide graph. Slide 1 is just a "Go!" button leading into slide 10, the real starting point. From there, most digits on most slides fold back into a closed loop of trap slides (`2, 4, 7, 9, 11, 12`) that can never reach the success slide — they just cycle or eventually dump you on the fail slide (`15`).

Only one digit per slide breaks out of the loop and pushes you one level deeper toward the exit. Tracing just those "escape" digits:

```
slide10 --(7)--> slide3
slide3  --(5)--> slide13
slide13 --(1)--> slide5
slide5  --(6)--> slide8
slide8  --(2)--> slide6
slide6  --(3)--> slide14  (Success!)
```

Every other digit at every one of those slides leads back into the trap network or straight to the fail slide — confirming there really is exactly one correct path, as promised.

#### Step-4:

Reading the digits off in the order they were clicked gives the combination:

```
7 - 5 - 1 - 6 - 2 - 3
```

Slide 14 ("Success!") confirms this number sequence is itself the answer.

#### Step-5:

Finally the flag becomes: **`751623`**