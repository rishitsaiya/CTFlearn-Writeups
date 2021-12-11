min_val = 5432100000001234
max_val = 5432109999991234
inc = 10000

def luhn_check(num):
    def sum_of_digits(n):
        s = str(n)
        t = 0
        for c in s:
            t += int(c)
        return t
    
    string = str(num)
    total = 0
    double = False
    for i in range(len(string) - 1, -1, -1):
        c = string[i]
        if double:
            total += int(c)*2 if int(c)*2 < 10 else sum_of_digits(int(c)*2)
        else:
            total += int(c)
        double = not double
    return total%10 == 0

for i in range(min_val, max_val, inc):
    if i%123457 == 0 and luhn_check(i):
        print(i)