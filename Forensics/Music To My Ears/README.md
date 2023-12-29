## Music To My Ears
The main idea finding the flag using faad-faac tool to fix the corrupted m4a files.

#### Step-1:
After we download `hereisyourflag.m4a` from the cloud, we try to open it but it doesn't help much. We come to know to know that it is corrupted during encoding.

#### Step-2:
While searching for ways to reverse the corrupted `.m4a` files, I came across this [article](https://sysfrontier.com/en/2014/12/31/hello-world/). This way uses a tool called [faad](http://rarewares.org/aac-decoders.php)-[faac](http://rarewares.org/aac-encoders.php) combination. 

#### Step-3:
Finally the flag becomes:
`flag{1_c4n_f1x_it}`