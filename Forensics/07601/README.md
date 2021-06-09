## 07601
The main idea finding the flag using basic forensics techniques.

#### Step-1:
After we download the given image `AGT.png` from the cloud, we just try simple techniques.

<img src="AGT.png">

#### Step-2:
I first tried a very basic `strings AGT.png` &  `strings AGT.png | grep {`.

I got the following output, through which I came to know about existing hidden directories.
```
...
ABCTF{fooled_ya_dustin}
...
*e
```
#### Step-3:
I tried this `ABCTF{fooled_ya_dustin}` flag, but it showed incorrect. So let's explore the hidden folders.

#### Step-4:
I tried `binwalk -e AGT.png`. I get a new directory called `_AGT.png.extracted`. Let's get into this.

#### Step-5:
The contents of which are some of the images and directory. I directly, tried
`strings I Warned You.jpeg | grep {`

#### Step-6:

I got this output:
```
{P|I
{zRhc
{>ch
^|){O
rU<o{
R3w{x
o	 {p
=d{]i
w{3)Z:
uYz}{
{uBH
*}{MD
}"W{
:Ja{
.?{M$f
!0{8
{/!s
tM,o{
{tLL
q{dG
b[{MTF
{Y1W
ABCTF{Du$t1nS_D0jo}1r
1{wl
{Y,x
6fr{+
q{:zG
Nv{%M#
{+	-"
Qa{+
tx"{
{!f'WkQV
XUg{
!{;xV
?Khh{
w#{]U#
JGdD{n
W]L{`g
{Z.W\
r"w{
.$A{
)cn_P{V
 b{5
:\7{{
gk{|(qwC
Vv{;t[Tjy#r
NR{{]
Pv{]JS
{'R-
${zT
Ac{*:]#
{Mj9
.	6{4
w{Y[8o
{zY\4
q{:g#g
roO{
F{Dfx$
mJ{#
OgRZho{
Ug3{x
'{u^n
b%{l^
r&*$b{
M|vMH{.
[R'{_
{P7v+
b{+W
/{+w
F{~aLVF
{:el
sIS{
8r:s{
I{M5
e%K#{
u5{1j
Bww{
{XW+
$v{/O
+6,{~aV
iNc{
{R8c
y)8{{0q
1{]'%<B
R{.x
{533
1{ue
:?{#&2B
{%c]2U
;#Y{
```

Luckily, here the flag worked.
#### Step-7:
Finally the flag becomes:
`ABCTF{Du$t1nS_D0jo}1r`
