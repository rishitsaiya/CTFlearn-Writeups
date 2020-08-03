encoded = "152 162 152 145 162 167 150 172 153 162 145 170 141 162"
list_encoded = encoded.split(' ')
decimal_encoded = [int(i, 8) for i in list_encoded]
string_encoded = [chr(i) for i in decimal_encoded]
string_encoded  = ''.join(string_encoded)
print("String Encoded: " + string_encoded)
