## ALEXCTF CR2: Many time secrets
The main idea finding the flag is decomposing the Hex dump and finding the public key.

#### Step-1:
After we download `msg(4)` from the cloud, we get the following data.

`0529242a631234122d2b36697f13272c207f2021283a6b0c79082f28202a302029142c653f3c7f2a2636273e3f2d653e25217908322921780c3a235b3c2c3f207f372e21733a3a2b37263b3130122f6c363b2b312b1e64651b6537222e37377f2020242b6b2c2d5d283f652c2b31661426292b653a292c372a2f20212a316b283c0929232178373c270f682c216532263b2d3632353c2c3c2a293504613c37373531285b3c2a72273a67212a277f373a243c20203d5d
243a202a633d205b3c2d3765342236653a2c7423202f3f652a182239373d6f740a1e3c651f207f2c212a247f3d2e65262430791c263e203d63232f0f20653f207f332065262c31683137223679182f2f372133202f142665212637222220733e383f2426386b`

Working out:
https://youtu.be/p4DIab6NKOY?t=307

The link for this tool is below:
https://github.com/SpiderLabs/cribdrag

#### Step-2:

I didn't have complete idea on proceeding on this challenge, so I took help from online and got this.

https://youtu.be/p4DIab6NKOY?t=307

#### Step-3:
Alternatively, same flag can be approached in another way also.

https://www.embeddedhacker.com/2020/01/hacking-walkthrough-ctflearn-crypto-medium/

#### Step-4:
Finally the flag becomes:
`ALEXCTF{HERE_GOES_THE_KEY}`