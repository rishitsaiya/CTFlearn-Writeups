## Rubber Duck
The main idea finding the flag using easiest forensics techniques.


#### Step-1:
After we download `RubberDuck.jpg`, we try to open and see the flag and check if we find any.

<img src="RubberDuck.jpg">

#### Step-2:
I tried simple techniques and easily found answer when we send the command:

`strings RubberDuck.jpg | grep {`

Note: Although some general techniques also include `strings RubberDuck.jpg | grep flag`  & `strings RubberDuck.jpg | grep ctf`.

#### Step-3:
We get the following output:
```
CTFlearn{ILoveJakarta}
e{8{"
	i~{
S:{s
^{Ec
2\G;{J
s9y{x
]^y{
=\u^{F
-{~?
{VVj
)@{1
G-%#{
".k{;y;3
U{U_
Bu{S/
n{b/
T{#G
*H{cF:
oT{S
!yl[ru{
\{t|
"{x0
iE7q,4${
Or/hr{
{c8w
{Qjjr
NYY,{
=F{?a
z{x^
q{X4
V{2n
`pY{
#:J^Z{
f{'z
{|D7
{43P
${X<a`
<H{OH
F{UbP
rjM#{+
Op{K
sp{A:`
bMm{e
u#y{g
jG\{
Q{Io
l{y	
9{Df
Yc{6
d9};{7
i:{#
{nh|q$7/
F#({4
o=#}0^{
Qx{M
{{~eG
{%.xp
c{Efeqf
QS]{
~{YE
1J{y
kQ.{
I{n1
+?y{c
\{@Q
_d9{
PA{h
{C)r
QI{)A
{@<J
:{!?
h%7{
v/Y{
e*P{
{b_&
TAr{
@{R#eq
 +l?{
sPUj{t
{ Q`_
```

#### Step-4:

Finally the flag becomes:

[comment]: <> (`CTFlearn{ILoveJakarta}`)
