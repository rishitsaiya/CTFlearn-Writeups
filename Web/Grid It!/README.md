## Grid It!
The main idea of finding the flag is SQL Null byte injection.

#### Step-1:
I simply had no idea after register/login page. I tried capturing packets through Burpsuite and got some cookie with ID patch and we had to resolve the proper Null Byte SQL Injection to get the USER table for admin password.

#### Step-2:
So, I looked up for writeup and finally got this:
https://github.com/terjanq/Flag-Capture/tree/master/Practice/CTFLearn/GridIt

#### Step-3:
Finally, the flag becomes: 
`ctflearn{obj3ct_inj3ct1on}`