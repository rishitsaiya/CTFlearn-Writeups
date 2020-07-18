import numpy as np

arr = np.arange(65,90).reshape(5, 5) # Array of alphabet
arr = np.where(arr <75, arr, arr+1)  # Array without 'K' 

cells = ["1-3","4-4","2-1","{","4-4","2-3","4-5","3-2","1-2","4-3","_","4-5","3-5","}"] 
for i in cells:
	if(ord(i[0])>=48 and ord(i[0])<=57):
		x=int(i[0])-1
		y=int(i[2])-1
		print(chr(arr[x][y]),end="")
	else:
		print(i[0],end="")
print("\n")