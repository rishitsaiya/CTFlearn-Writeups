count = 0

file = 'data.dat'

with open(file) as f:    
        l = f.readlines()
        for line in l:
                zero = line.count('0')
                one = line.count('1')
                '''the condition where the number of '0' is divisible by 3 
                OR the number of '1' is divisible by 2'''
                if (zero%3 == 0) or (one%2 == 0):
                        count = count + 1

print("Number of lines: " + str(count))
f.close()
