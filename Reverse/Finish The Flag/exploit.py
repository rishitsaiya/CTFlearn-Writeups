import gdb

gdb.execute('break *0x80480af')
gdb.execute('run')

flag = ''
for i in range(7):
    dl = gdb.parse_and_eval('$dl')
    flag += chr(dl)

    gdb.execute('continue')

print("CTFlearn{" + flag)
