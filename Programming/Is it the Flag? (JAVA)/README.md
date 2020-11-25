## Is it the Flag? (JAVA)
The main idea finding the flag using JAVA knowledge and better Mathematical skills than Bruteforce.


#### Step-1:
After we download `IsItTheFlag.java`, we see the contents as follows:

```java
public class IsItTheFlag {

public static boolean isFlag(String str) {
	return str.hashCode() == 1471587914 && str.toLowerCase().hashCode() == 1472541258;
}

public static void main(String[] args) {

String flag = "------";

if (isFlag(flag))
	System.out.println("You found it!");
else
	System.out.println("Try again :(");

	}
}
```

#### Step-2:
We see that program is quite simple, except the hashCode function of JAVA. If you don't have idea on it, please refer to following link:

https://howtodoinjava.com/java/string/string-hashcode-method/


#### Step-4:

We know that `flag.hashCode() == 1471587914`, so let's check from the start. 
Our option for each letter is : list=[alphanumeric](0-9 A-Z a-z).

#### Step-5:

So let us assume that the first letter is '0' , this mean that we need to ensure 2 things:  
- Sum this letters with all the next letter at maximum value (**122**) , the hashcode of the flag will be 
 `>= 1471587914`. 

	By that we can play with the next characters and to the same algorithm we just did.  
Because if this smaller than 1471587914. No matter what will be the next letter this will not be equal to 1471587914.

- Sum this letters with all the next letter at **minimum** value (48) , the hashcode of the flag will be 
 `<= 1472541258`. 

	By that we can play with the next characters and to the same algorithm we just did.  
Because if this bigger than 1472541258 , No matter what will be the next letter this will not be equal to 1472541258.

#### Step-6:
Hence by executing the following `Flag.py` script by `python3 Flag.py`yields us the flag.

```py
import sys

def java_string_hashcode(s): # The hashCode function in java.
    h = 0
    for c in s:
        h = (31 * h + ord(c)) & 0xFFFFFFFF
    return ((h + 0x80000000) & 0xFFFFFFFF) - 0x80000000

def isFlag(str):
        return java_string_hashcode(str) == 1471587914 and java_string_hashcode(str.lower) == 1472541258 # The function from the CTF.

def main():
   sum=0
   max1 = pow(31, 4) * 122 # Max option of alphanumeric characters.
   min1 = pow(31, 4) * 48  # Min option of alphanumeric characters.
   max2 = pow(31, 3) * 122
   min2 = pow(31, 3) * 48
   max3 = pow(31, 2) * 122
   min3 = pow(31, 2) * 48
   max4 = pow(31, 1) * 122
   min4 = pow(31, 1) * 48
   max5 = 122
   min5 = 48
   list=[]                  # Make a list of alphanumeric characters.
   for i in range (48,58):
       list.append(i)
   for i in range (65,91):
       list.append(i)
   for i in range(97, 123):
       list.append(i)

   for i0 in list:
       x0 = pow(31, 5) * i0
       if (x0 + max1 + max2 + max3 + max4 + max5 >= 1471587914 and x0 + min1 + min2 + min3 + min4 + min5 <= 1472541258):
           print("flag[0] =", i0)

           for i1 in list:
               x1 = pow(31, 4) * i1
               if (x0 + x1 + max2 + max3 + max4 + max5 >= 1471587914 and x0 + x1 + min2 + min3 + min4 + min5 <= 1472541258):
                   print("flag[1] = ", i1)

                   for i2 in list:
                       x2 = pow(31, 3) * i2
                       if (x0 + x1 + x2 + max3 + max4 + max5 >= 1471587914 and x0 + x1 + x2 + min3 + min4 + min5 <= 1472541258):
                           print("flag[2] = ", i2)

                           for i3 in list:
                               x3 = pow(31, 2) * i3
                               if (x0 + x1 + x2 + x3 + max4 + max5 >= 1471587914 and x0 + x1 + x2 + x3 + min4 + min5 <= 1472541258):
                                   print("flag[3] = ", i3)

                                   for i4 in list:
                                       x4 = pow(31, 1) * i4
                                       if (x0 + x1 + x2 + x3 + x4 + max5 >= 1471587914 and x0 + x1 + x2 + x3 + x4 + min5 <= 1472541258):
                                           print("flag[4] = ", i4)

                                           for i5 in list:
                                               x5 = i5
                                               if (x0 + x1 + x2 + x3 + x4 + x5 == 1471587914 ):
                                                       flag = ""
                                                       flag += chr(i0) + chr(i1) + chr(i2) + chr(i3) + chr(i4) + chr(i5)
                                                       if(java_string_hashcode(flag.lower())==1472541258):  # Check for the lowercase condition.
                                                           print("The flag is:", flag)
                                                           sys.exit()
main()
```

#### Step-7:
Finally the flag becomes:
`CTFlearn{0gHzxY}`
