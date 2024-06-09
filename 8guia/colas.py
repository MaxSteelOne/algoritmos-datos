from queue import Queue as Cola
import random

# 13
def generar_nros_azar(cantidad:int,desde:int,hasta:int)->Cola[int]:
    xc : Cola[int] = Cola()

    for i in range(cantidad):
        xn : int = random.randint(desde,hasta)
        xc.put(xn)
    return xc

# 14
def cant_elementos(xc: Cola[int])->int:
    cant : int = 0
    xl   : list[int] = []

    print(f"INICIO: {xc.queue}")
    while not xc.empty() :
        cant+=1
        xl.append(xc.get())
    
    for i in xl:
        xc.put(i)

    print(f"FINAL: {xc.queue}")
    return cant

# 15
def buscar_maximo(xc : Cola[int])->int:
    print(xc.queue)
    maximo : int = xc.get()
    xl : list[int] = []
    xl.append(maximo)
    while not xc.empty():
        temp   : int = xc.get()
        xl.append(temp) 
        if maximo <= temp:
            maximo = temp
    for i in xl:
        xc.put(i)
    print(f"HEY: {xc.queue}")
    return maximo

# 16 
def armar_seq_bingo()->Cola[int]:
    xl : list[int] = list(range(100))
    random.shuffle(xl)
    
    xc : Cola[int] = Cola()
    for i in xl:
        xc.put(i)
    return xc

def hora_bingo(carton: list[int],bolillero: Cola[int])->int:
    apariciones : int = 0
    vueltas : int = 0
    while apariciones != 12:
        numero : int = bolillero.get()
        vueltas+=1
        if(numero in carton):
            apariciones+=1
    return vueltas

# ejBoli = armar_seq_bingo()
# ejcarton = [37, 84, 29, 57, 93, 19, 8, 21, 46, 62, 10, 55]

# 17
def nro_pacientes_urgentes(xc:Cola[tuple[int,str,str]])->int:
    print(xc.queue)
    total_pacientes_uregentes : int = 0
    xl : list[tuple[int,str,str]]  = []

    while not xc.empty() :
        turno : tuple[int,str,str] = xc.get()
        xl.append(turno)
        if turno[0] <= 3 :
            total_pacientes_uregentes+=1
    
    for i in xl:
        xc.put(i)
    print(xc.queue)

    return total_pacientes_uregentes
