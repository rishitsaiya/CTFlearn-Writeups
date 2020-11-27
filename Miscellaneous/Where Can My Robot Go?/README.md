## Where Can My Robot Go?
The main idea finding the flag using simple logic and some un-accessed web pages.

#### Step-1:
After we read question, there is literally no hint to go anywhere. So I tried 
`https://ctflearn.com/robots.txt` to get some hint.

#### Step-2:
It showed me following output:

```bash
User-agent: *  
Disallow: /70r3hnanldfspufdsoifnlds.html
```

#### Step-3:
So I went to that web page by:
`https://ctflearn.com/70r3hnanldfspufdsoifnlds.html `

I got the flag there.
#### Step-4:

Finally the flag becomes:
`CTFlearn{r0b0ts_4r3_th3_futur3}`
