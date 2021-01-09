import base64 as rtfd
import webbrowser
import time
def mikeSwift(cre):
    sto = []
    gre = ""
    for i in cre:
        sto.append(i+str(len(i)))
        sto.append("h4ck" + i)
    for i in sto:
        gre+=i
    return gre
def prompt():
    return bytes(input("Welcome to the loading dock. What is the password?\t"), 'utf-8')
def obfuscate(bys):
    fusc = rtfd.b64encode(bys)
    fusc += b"534345fdfgfgfdhty6y56yjl"
    fusc = str(fusc)
    fusc = fusc[2:len(fusc)-1]
    refus = []
    for i in fusc:
        refus.append((str(i)))
    fusc="florSFIUEfet4565477"
    for i in refus:
        fusc+=i
    return fusc
def crypt(sor):
    sro = []
    fusc = "893"
    for i in range(len(sor)):
        sro.append(sor[i]+str(i))
    sro.reverse()
    for i in sro:
        fusc+=i
    return fusc
def grant():
    print("Congartulation. Pleas Procid")
    webbrowser.open("https://ctflearn.com/index.php?action=find_problem_details&problem_id=449")
def punish():
    print("This is going to hurt.")
    while True:
        time.sleep(.1)
        webbrowser.open("https://www.youtube.com/watch?v=O3asoGVHix8")
def main():
    sik1 = prompt()
    sik = obfuscate(sik1)
    sik = crypt(sik)
    sik = mikeSwift(sik)
    if sik == "81h4ck891h4ck931h4ck3l1h4ckl81h4ck821h4ck2j1h4ckj81h4ck811h4ck1y1h4cky81h4ck801h4ck061h4ck671h4ck791h4ck951h4ck571h4ck781h4ck8y1h4cky71h4ck771h4ck761h4ck671h4ck761h4ck6y1h4cky71h4ck751h4ck5t1h4ckt71h4ck741h4ck4h1h4ckh71h4ck731h4ck3d1h4ckd71h4ck721h4ck2f1h4ckf71h4ck711h4ck1g1h4ckg71h4ck701h4ck0f1h4ckf61h4ck691h4ck9g1h4ckg61h4ck681h4ck8f1h4ckf61h4ck671h4ck7d1h4ckd61h4ck661h4ck6f1h4ckf61h4ck651h4ck551h4ck561h4ck641h4ck441h4ck461h4ck631h4ck331h4ck361h4ck621h4ck241h4ck461h4ck611h4ck131h4ck361h4ck601h4ck051h4ck551h4ck591h4ck9=1h4ck=51h4ck581h4ck801h4ck051h4ck571h4ck7n1h4ckn51h4ck561h4ck6R1h4ckR51h4ck551h4ck5s1h4cks51h4ck541h4ck4R1h4ckR51h4ck531h4ck3z1h4ckz51h4ck521h4ck2Z1h4ckZ51h4ck511h4ck1f1h4ckf51h4ck501h4ck0V1h4ckV41h4ck491h4ck9T1h4ckT41h4ck481h4ck8M1h4ckM41h4ck471h4ck7f1h4ckf41h4ck461h4ck6N1h4ckN41h4ck451h4ck5H1h4ckH41h4ck441h4ck4Z1h4ckZ41h4ck431h4ck3y1h4cky41h4ck421h4ck2R1h4ckR41h4ck411h4ck1z1h4ckz41h4ck401h4ck0d1h4ckd31h4ck391h4ck9r1h4ckr31h4ck381h4ck8N1h4ckN31h4ck371h4ck7G1h4ckG31h4ck361h4ck6N1h4ckN31h4ck351h4ck5i1h4cki31h4ck341h4ck491h4ck931h4ck331h4ck311h4ck131h4ck321h4ck2Z1h4ckZ31h4ck311h4ck101h4ck031h4ck301h4ck0w1h4ckw21h4ck291h4ck9m1h4ckm21h4ck281h4ck8R1h4ckR21h4ck271h4ck771h4ck721h4ck261h4ck6J1h4ckJ21h4ck251h4ck5X1h4ckX21h4ck241h4ck4Z1h4ckZ21h4ck231h4ck3i1h4cki21h4ck221h4ck2l1h4ckl21h4ck211h4ck131h4ck321h4ck201h4ck0Y1h4ckY11h4ck191h4ck971h4ck711h4ck181h4ck871h4ck711h4ck171h4ck741h4ck411h4ck161h4ck651h4ck511h4ck151h4ck561h4ck611h4ck141h4ck451h4ck511h4ck131h4ck341h4ck411h4ck121h4ck2t1h4ckt11h4ck111h4ck1e1h4cke11h4ck101h4ck0f1h4ckf91h4ck9E1h4ckE81h4ck8U1h4ckU71h4ck7I1h4ckI61h4ck6F1h4ckF51h4ck5S1h4ckS41h4ck4r1h4ckr31h4ck3o1h4cko21h4ck2l1h4ckl11h4ck1f1h4ckf01h4ck0":
        grant()
    else:
        punish()
main()