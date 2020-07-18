## Up For A Little Challenge?
The main idea finding the flag is to consecutively use Forensics commands.

#### Step-1:
After we download `Begin Hack.jpg` from the cloud, we try to understand what is the content. <br>

<img src="Begin Hack.jpg">


#### Step-2:
Then I tried `strings Begin hack.jpg` and got the following output:


```
JFIF
Exif
8Photoshop 3.0
8BIM
8BIM
S@%c
&T6d
'E7e
()*89:HIJWXYZghijwxyz
0"2Q
3#aB
c6p&ET
()*789:FGHIJUVWXYZdefghijstuvwxyz
mQ15
TLMm
[m[mQ15
*tMD
"k4J
Rs]n
<zbpM
;ELN
*gEN
=a?6m
bj'j
:5LN
[m[m[mZ4
_|RW
zgm19
-{{?_
:UWXV
A_~{
[mRQ.
MtMm
_b|g
)bum
Q;TLMm
j&5i
\_s5sH
mQ:j6
mQ15
[mFw\j
y0X,
Yyrx
	iKJ
DC(jC)dwC
?HxC
Cl|G
/sPj
MJ,h`
550]
4KvwUp
QYj,
n7~$N[$
-g0L
Gmu5
i*iSJ
]ZIsk
g<W1M
LE4l^\
wdc.)
:}^Xs
ML	~
1bdM;V
Lub 
%)p_
d(3D
gqm6
[y|7
Qoq-
)kAO
j.YJ
t)9m
U>iy
}p.<E1
.Xm5
Yu>6p
_f;>Yd$W
&MBo
X?$6
bjCL
k)p$
W&YL
19b$
^8/_
l',r
%pRG
H4\p
R/C,^
7l#Y
Oi?h
w	+V
|^7V*
QXmG5_?
/E'C
.$%er
o%))
:?ab
y+q\
5O9e?%j?
_&j"
1,G$+
CS@?
*zHr
Z#8CLQ_$#
1exh
1yjyw(
'Trj
`- https://mega.nz/#!z8hACJbb!vQB569ptyQjNEoxIwHrUhwWu5WCj1JWmU-OFjf90Prg -N17hGnFBfJliykJxXu8 -
=u}B
{Y4B
R_:/
/bTK
T8(w
}SPF*
.YRi,
m%<p
7<S:
CdRR
5Ol=
7Ge'
!1AQaq
 0@P`p
rK2*
=611y
*E%9
M`H0X_
_W]y
!{u~
	$V/
r%LL
;3;;
vj54
=}pW
5p^-
?s$X0?]
4@a4
=reg#
9*fL'
Mp real_unlock_key: Nothing Is As It SeemsU
~t>?
pb}X8a
;>)I$
A16hM
O9]F
K_Es
OQcc
{8OI
<T|pF
t<?EK*
)#0=n
b_74
^x<sN
1u{k
Nitr
b9R6
(Q{T
 F>_
bK(1
c	<AI<a
JxAD
AQa q
0@P`p
]!ql>
-L_Q
c<gg
c='I
_l2A5
5~Fh
89]M}+
^Jx(
)_4b
LQ")
zy=>
n66k
NuHPO
;(hO
+vU8*
+CL@
NiiJo
"Y#).3
kw]}
1|yq
UB!1/OV1
nt }
0+<$<
:Rgh
Qo"P
?a>^
)gN0e&W
Xzbg
T	7JA
	bZ<R
N: r@
%r",r
 #=#
U@!e
H/ga
8HK/
iPi5
|XPr
yJ6P
KeMLx
bQvs
MSU}
"*OL
Y@dmf
J\yE
%PEuW
yDYUE
 password: Really? Again
3oC=
S MWX
lwPBj
XR0W'
@t-%
flag{Not_So_Simple...}
?@};
7b,,*
W*)^
#zZ&
 Oqq
uS%f
yB1+!
w)%	>
y:O	@
tt'8
1F?jn
;'"K
|q=_
=U$a
FS	`
8nzo	a~
Trqe@
(~CK9&
Jq$?
@a:O>
ea!%!
e$Ef
yQ(u$65
4"< 
s^)V
```

#### Step-3:
This output has opened a lot of gateways for us to explore. So let's try to visit the URL given to us:
https://mega.nz/file/z8hACJbb#vQB569ptyQjNEoxIwHrUhwWu5WCj1JWmU-OFjf90Prg

We get a new zip file there named `Up For A Little Challenge.zip`. 
 
#### Step-4:
After we unzip and try to find content (including all hidden files, by `ls -al`), I found the directory `Did I Forget Again?` and in that I found an image and another compressed file called `.Processing.cerb4`.

#### Step-5:

When I tried to unzip it, I found an image `skycoder.jpg` which was encrypted.

This is the time you have to be little smart and try the password from given things only. I tried to search above strings search and found password there: `Nothing Is As It Seems`. 

#### Step-6:
Finally we get this image. Flag is right bottom corner.

<a href="https://ibb.co/3pb7kpN"><img src="https://i.ibb.co/HtyVXtz/skycoder.jpg" alt="skycoder" border="0"></a>

#### Step-7:
Finally the flag becomes:
`flag{hack_complete}`
