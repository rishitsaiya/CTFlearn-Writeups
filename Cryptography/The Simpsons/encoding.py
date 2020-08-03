# Passamos os valores pro python
encoded = "152 162 152 145 162 167 150 172 153 162 145 170 141 162"
# Transformamos a string em uma lista
list_encoded = encoded.split(' ')
# Convertemos cada valor octal para decimal
decimal_encoded = [int(i, 8) for i in list_encoded]
# Vamos transformar isso em um texto, pois cada numero decimal deve ser um caractere ASCII
string_encoded = [chr(i) for i in decimal_encoded]
# Juntando os caracteres em uma string única
string_encoded  = ''.join(string_encoded)
print("String Encoded: " + string_encoded)
