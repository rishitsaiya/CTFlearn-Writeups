## PDF by fdpumyp
The main idea to find the flag is to use strings and basic crypto recon.

#### Step-1:
We are given the document `dontopen.pdf`.

#### Step-2:
When we do a `strings dontopen.pdf`, we get the following output:
```bash
...
== SECRET DATA DONT LOOK AT THIS ==
external:Q1RGbGVhcm57KV8xbDB3M3kwVW0wMG15MTIzfQ==
pin:1234
password:MTIzMVdST05HOWlzamRuUEFTU1dPUkQ=
endstream
endobj
xref
0000149877 00000 n 
13 1
0000150079 00000 n 
trailer
<</Size 14/Root 8 0 R/Info 1 0 R/Prev 149539>>
startxref
150295
%%EOF
```

#### Step-3:
I decoded that key using `echo Q1RGbGVhcm57KV8xbDB3M3kwVW0wMG15MTIzfQ== | base64 -d`.

Voila, I got the flag.

#### Step-4:
Finally, the flag becomes:
`CTFlearn{)_1l0w3y0Um00my123}`