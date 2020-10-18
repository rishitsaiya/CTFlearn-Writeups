## Minions
The main idea to find the flag is to use Binwalk and basic Crypto recon.

#### Step-1:
We are given this image `Hey_You.png`

<img src="Hey_You.png">

#### Step-2:
When we do a `strings Hey_You.png`, we get the following output:
```bash
...
Rar!
$You_Still_Here/Nothing_Here_16/..txt
Ac]I
https://mega.nz/file/wZw2nAhS#i3Q0r-R8psiB8zwUrqHTr661d8FiAS1Ott8badDnZkoH
You_Still_Here/Nothing_Here_1
You_Still_Here/Nothing_Here_10
You_Still_Here/Nothing_Here_11
You_Still_Here/Nothing_Here_12
You_Still_Here/Nothing_Here_13
You_Still_Here/Nothing_Here_14
You_Still_Here/Nothing_Here_15
You_Still_Here/Nothing_Here_16
You_Still_Here/Nothing_Here_17
You_Still_Here/Nothing_Here_18
You_Still_Here/Nothing_Here_19
You_Still_Here/Nothing_Here_2
You_Still_Here/Nothing_Here_3
You_Still_Here/Nothing_Here_4
You_Still_Here/Nothing_Here_5
You_Still_Here/Nothing_Here_6
You_Still_Here/Nothing_Here_7
You_Still_Here/Nothing_Here_8
You_Still_Here/Nothing_Here_9
You_Still_Here
```
I visited that link mentioned: 
https://mega.nz/file/wZw2nAhS#i3Q0r-R8psiB8zwUrqHTr661d8FiAS1Ott8badDnZkoH

#### Step-3:
We get another image from there `Only_Few_Steps.jpg`.

<img src="Only_Few_Steps.jpg">

If we do `strings Only_Few_Steps.jpg`, we get following output:
```bash
...
YouWon(Almost).jpg
```

#### Step-4:
This says that we have to use `binwalk --extract --dd=".*." Only_Few_Steps.jpg`, to get that other image. After extracting we got the following image:

<img src="YouWon(Almost).png">

#### Step-5:
When we do `strings YouWon(Almost).jpg`, we get the following output:
```bash
...
CTF{VmtaU1IxUXhUbFZSYXpsV1RWUnNRMVpYZEZkYWJFWTJVVmhrVlZGVU1Eaz0=}
```
After decoding that Base64 string, we get the flag.

#### Step-6:
Finally, the flag becomes:
`CTF{M1NI0NS_ARE_C00L}`
