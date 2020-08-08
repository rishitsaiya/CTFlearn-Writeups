## The Credit Card Fraudster
The main idea of finding the flag is Bruteforce the strings.

#### Step-1:
I generally use APK Decompiling tools, but this was easy, so I just decompiled it online [here](http://www.javadecompilers.com/apk).

I started to look for MainActivity.java file. I got it at location:
sources/com/example/secondapp/MainActivity.java

#### Step-2:
This flag has 3 parts. We basically need to dehash the given hash.

```
b74dec4f39d35b6a2e6c48e637c8aedb
```

#### Step-3:
I did it online at: https://www.md5online.org/md5-decrypt.html

<img src="Flag.png">

#### Step-4:
Finally, the flag becomes: 
`CTFlearn{Spring2019_is_not_secure!}`