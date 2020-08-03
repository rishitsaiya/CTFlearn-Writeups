## Don't Bump Your Head(er)
The main idea finding the flag is get flag using curl or Burpsuite.

#### Step-1:
I visited the given link: http://165.227.106.113/header.php

<img src="Web1.png">

#### Step-2:
Then I tried to change method of request and see the difference.
`curl -X POST http://165.227.106.113/header.php`

Output:
```bash
Sorry, it seems as if your user agent is not correct, in order to access this website. The one you supplied is: curl/7.68.0
<!-- Sup3rS3cr3tAg3nt  -->
```
#### Step-3:
So, now I knew next header change has to be with the user. So I input
`curl -H "User-Agent: Sup3rS3cr3tAg3nt" http://165.227.106.113/header.php`

Output:
```bash
Sorry, it seems as if you did not just come from the site, "awesomesauce.com".
<!-- Sup3rS3cr3tAg3nt  -->
```

#### Step-4:
So, then I tried to visit the website awesomesauce.com, but it is not hosted on web server, it is used rather being referred to http://165.227.106.113/header.php.

So, I tried to change that also with the header.
`curl -H "User-Agent: Sup3rS3cr3tAg3nt" -H "Referer:awesomesauce.com" http://165.227.106.113/header.php`

Output:
```bash
Here is your flag: flag{did_this_m3ss_with_y0ur_h34d}
<!-- Sup3rS3cr3tAg3nt  -->
```
#### Step-5:
Finally the flag becomes: 
`flag{did_this_m3ss_with_y0ur_h34d}`