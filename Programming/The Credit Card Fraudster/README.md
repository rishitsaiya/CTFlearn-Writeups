## The Credit Card Fraudster
The main idea is checking numbers in a given range against the Luhn algorithm

#### Step-1:
Implement the Luhn algorithm which works like this:
1. Start from the least significant (right most) digit
2. Take the sum of the digits from right to left but double every second digit. If the digit doubled is greater than 10, take the sum of the digits on that doubled value
3. If the final value can divide evenly into 10, passes the Luhn check, otherwise it does not

#### Step-2:
Now we need to get the range of numbers that fit the credit card number in the format of `543210******1234`. This would mean all numbers from `5432100000001234` to `5432109999991234` with an increment of `10000`

#### Step-3:
Loop through all possible numbers, check if it's divisible by `123457` and passes the Luhn check.

#### Step-4:
The flag is revealed after running the script.