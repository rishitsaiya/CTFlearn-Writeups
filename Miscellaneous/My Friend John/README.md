## My Friend John
The main idea is learning how to use tools for cracking password protected zip files.

#### Step-1:
We can open [`MyFriendJohn.zip`](./MyFriendJohn.zip) using [7zip](https://www.7-zip.org/) and extract `use-rockyou.zip`.

#### Step-2:
Now we need a password to open `use-rockyou.zip`. There's a really popular wordlist called rockyou which can be downloaded [here](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt).

#### Step-3:
We can use [fcrackzip](https://github.com/hyc/fcrackzip)'s dictionary attack: `fcrackzip -v -u -D -p rockyou.txt use-rockyou.zip` using rockyou.

#### Step-4:
We now see `custom-list.txt` and `custom-list.zip`. We can use the custom word list to unlock the the zip file: `fcrackzip -v -u -D -p custom-list.txt custom-list.zip`.

#### Step-5:
The last zip file is called `brute-force-pin.zip`. A pin is usually between 4 and 6 numeric digits. `fcrackzip -b -c "1" -l 4-6 -v -u brute-force-pin.zip`. The `-c "1"` means only use numeric digits when bruteforcing.

#### Step-6:
Finally we get a `flag.txt` and the flag becomes:
`CTFlearn{s0_n0W_y0uv3_M3t_J0hN}`