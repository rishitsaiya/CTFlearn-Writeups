## Taking LS
The main idea finding the flag using simple Git commands to find hidden passwords and flag.

#### Step-1:
After we download the given zip `gitIsGood.zip` from the cloud, we just try simple techniques.

After we unzip, we get a directory called `gitisGood`.

#### Step-2:
I went into  `gitisGood` directory and tried 
`ls -al` command to get following output:

```
total 16
drwxr-xr-x 3 rishit rishit 4096 Oct 30  2016 .
drwxr-xr-x 3 rishit rishit 4096 Jul 10 16:43 ..
-rw-r--r-- 1 rishit rishit   15 Oct 30  2016 flag.txt
drwxr-xr-x 8 rishit rishit 4096 Oct 30  2016 .git
```

#### Step-3:
Next, I tried `cat flag.txt`, but seems like that flag `flag{REDACTED}` is incorrect. 

#### Step-4:
So we try to explore the `.git` directory. Get into that directory to know the changes that were done on the `flag.txt`

#### Step-5:
I tried `git log` and came to know that the file was changed 3 times by the following output:

```
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:33:18 2016 -0400

    Edited files

commit 195dd65b9f5130d5f8a435c5995159d4d760741b
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:32:44 2016 -0400

    Edited files

commit 6e824db5ef3b0fa2eb2350f63a9f0fdd9cc7b0bf
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:32:11 2016 -0400

    edited files
```

#### Step-6:
So to know the changes we need to add some additional flag and the command becomes:

`git log -p`

The output is as follows:
```
commit d10f77c4e766705ab36c7f31dc47b0c5056666bb (HEAD -> master)
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:33:18 2016 -0400

    Edited files

diff --git a/flag.txt b/flag.txt
index 8684e68..c5250d0 100644
--- a/flag.txt
+++ b/flag.txt
@@ -1 +1 @@
-flag{protect_your_git}
+flag{REDACTED}

commit 195dd65b9f5130d5f8a435c5995159d4d760741b
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:32:44 2016 -0400

    Edited files

diff --git a/flag.txt b/flag.txt
index c5250d0..8684e68 100644
--- a/flag.txt
+++ b/flag.txt
@@ -1 +1 @@
-flag{REDACTED}
+flag{protect_your_git}

commit 6e824db5ef3b0fa2eb2350f63a9f0fdd9cc7b0bf
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:32:11 2016 -0400

    edited files

diff --git a/flag.txt b/flag.txt
new file mode 100644
index 0000000..c5250d0
--- /dev/null
+++ b/flag.txt
@@ -0,0 +1 @@
+flag{REDACTED}
```

#### Step-7:
Finally the flag becomes:
`flag{protect_your_git}`