from queue import LifoQueue as Pila
import random

# 8
def generar_nros_azar(cantidad:int,desde:int,hasta:int)->Pila[int]:
    p : Pila[int] = Pila()
    for i in range(cantidad):
        w = random.randint(desde,hasta)
        p.put(w)
    return p
    
ejemplo = generar_nros_azar(5,0,99)

# 9
def contar_elementos(xl:Pila):
    acc :int = 0
    xlista : list[int] = []
    while(not xl.empty()):
        xlista.append(xl.get())
        acc+=1
    plen : int = len(xlista)-1
    while(0<=plen):
        xl.put(xlista[plen])
        plen-=1
    return acc

# 10 
def buscar_maximo(xl:Pila[int])->int:
    print(xl.queue)
    dobleXL : list[int] = []
    maximo : int = xl.get()
    dobleXL.append(maximo)
    while(not xl.empty()):
        temp: int = xl.get()
        dobleXL.append(temp)
        if(temp>=maximo):
            maximo = temp
    while(len(dobleXL)!=0):
        xl.put(dobleXL.pop())
    print(xl.queue)
    return maximo

# 11
def esta_balanceada(formula:str)->bool:
    ppila : Pila[str] = Pila()
    for i in formula:
        if i=="(":
            ppila.put(i)
        elif i==")":
                if(ppila.empty()):
                    return False
                else:
                    ppila.get()
    return ppila.empty()
   
# 12
def evaluar_expresion(formula:str)->float:
    xl : list[int] = []
    et : str       = ""
    for i in formula:
        if i!=" ":
            et+=i
        else:
            xl.append(et)
            et=""
    if et:
        xl.append(et)
    # ahora el como se hace la cuenta
    xp : Pila[int] = Pila()
    for x in xl:
        if "0"<=x and x<="9":
            xp.put(x)
        else:
            aa : int = int(xp.get())
            bb : int = int(xp.get())
            
            if x=="+":
                xp.put(bb+aa)
            if x=="-":
                xp.put(bb-aa)
            if x=="*":
                xp.put(bb*aa)
            if x=="/":
                xp.put(bb/aa)
    
    return xp.get()

