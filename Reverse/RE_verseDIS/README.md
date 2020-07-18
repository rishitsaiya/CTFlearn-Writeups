## Lost In The Binary
The main idea finding the flag by IDA.


#### Step-1:
After we get the link:
[https://mega.nz/#!XOwVmCSC!ut_5r6b32j2kD6EvlvsvJhmm58pbswusUXF08yI93Zo](https://mega.nz/#!XOwVmCSC!ut_5r6b32j2kD6EvlvsvJhmm58pbswusUXF08yI93Zo), we get the the binary file `problem`.

#### Step-2:
After opening it in ida64, we get this code,

<a href="https://ibb.co/6gywdYw"><img src="https://i.ibb.co/0hn2wq2/code.png" alt="code" border="0"></a><br /><a target='_blank' href='https://imgbb.com/'></a><br />

So its pretty clear that we use Anti-Debugging Technique for which hints are given in the question. That leads to `LABEL_2`.  
We will avoid from that by changing `jnz` to `jmp` in `ida64`.

#### Step-3:
<a href="https://ibb.co/h8ByT3r"><img src="https://i.ibb.co/s3K2X8c/ptrace.png" alt="ptrace" border="0"></a><br /><a target='_blank' href='https://imgbb.com/'>picture url</a><br />

As you can see there is output "Input password" and our input go to the variable `input`. 
After that the value in key that is `IdontKnowWhatsGoingOn` `mov` to `key2`.

#### Step-4:

In the next instruction we put in `msg` the result of "str[4 * i] ^ LOBYTE(key2[i]);".  

Later we are going through every letter in out `input` and checking if this equal to the letter ing `msg`.
  
So our only job is to break before the check and see what in `msg` .

#### Step-5:

First thing find our address to break.

Using Radar2 and accessing the data stored in RAX,
we get the message in `0x555555755140` RAX's data.

#### Step-6:

Finally the flag becomes:
`AbCTF{r3vers1ng_dud3}`