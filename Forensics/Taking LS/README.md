## Taking LS
The main idea finding the flag using simple LS commands to find hidden passwords and flag.

#### Step-1:
After we download the given zip `The Flag.zip` from the cloud, we just try simple techniques.

After we unzip the 2 folders in it, we get 2 directories named `__MACOSX` & `The Flag`.

#### Step-2:
I went into  `The Flag` directory and tried 
`ls -al` command to get following output:
```
total 40
drwxr-xr-x 3 rishit rishit  4096 Oct 30  2016  .
drwxr-xr-x 4 rishit rishit  4096 Jul 10 16:13  ..
-rw-r--r-- 1 rishit rishit  6148 Oct 30  2016  .DS_Store
-rw-r--r-- 1 rishit rishit 16647 Oct 30  2016 'The Flag.pdf'
drwxr-xr-x 2 rishit rishit  4096 Oct 30  2016  .ThePassword
```
Note: `The Flag.pdf` is password protected.
We need to retrieve the password.

#### Step-3:
Next, I got into `.ThePassword` directory and tried `ls` command to get this:

```
ThePassword.txt
```

#### Step-4:
Let's do a `cat ThePassword.txt` to get the Password.

`Nice Job!  The Password is "Im The Flag".`

#### Step-5:
Let's try this password on `The Flag.pdf` and its works!

#### Step-7:
Finally the flag becomes:
`ABCTF{T3Rm1n4l_is_C00l}`