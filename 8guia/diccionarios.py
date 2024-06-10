# f = open("tres-lineas.txt",'r')
# oraciones = f.readlines()









# f.close()

# linea = "u do tre  cuat cuat do u u  "
# linea+=" "
# palabra = ""
# dc = {}

# for letra in linea:
    
#     if letra != " ":
#         palabra+=letra
#     else:
#         long_palabra = len(palabra)
#         if not long_palabra in dc:
#             dc[long_palabra] = 1
#         else:
#             dc[long_palabra] += 1

#         palabra=""
# del dc[0]
# print(dc)

def contar_palabras(archivo:str)->dict:
    dc : dict = {}

    f = open(archivo,'r')
    lineas = f.readlines()
    f.close()

    for linea in lineas:
        palabra = ""
        oracion = linea+" "
        for letra in oracion:
            if letra != " ":
                palabra+=letra
            else:
                if " " in palabra:
                    palabra = ""
                else:
                    long_palabra = len(palabra)
                    if not long_palabra in dc:
                        dc[long_palabra] = 1
                    else:
                        dc[long_palabra] += 1
                    palabra = ""
            

    if 0 in dc:
        del dc[0]

    return dc


print(contar_palabras("tres-lineas.txt"))