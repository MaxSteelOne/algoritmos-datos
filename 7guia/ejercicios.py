# Ej 1.1
"""def pertenecev1 (llista: list[int],elem: int)->bool:
    res= False
    for numero in llista:
        if(numero==elem):
            res=True
    return res

    v2
    ii: int = 0 
    while(ii<len(llista)):
        if(llista[ii]==elem):
            res = True
        ii+=1
    return res"""
def pertenece_global(xl:list,elem)->bool:
        for i in xl:
            if(i==elem):
                return True
        return False
    # la otra posible solucion es un ""

# Ej 1.2
def divide_a_todos(xlista: list[int],divisor:int)->bool:
    for elemento in xlista:
        if(not elemento%divisor==0):
            return False
    return True

# Ej 1.3
def suma_total(xlista: list[int])->int:
    acc=0
    for i in xlista:
        acc+=i
    return acc

# Ej 1.4
def ordenador(xlista: list[int])->bool:
    for ii in range(0,len(xlista)-1):
        if(xlista[ii]>=xlista[ii+1]):
            return False
    return True

# Ej 1.5
def tiene_palabra_larga (xlista: list[str])->bool:
    for i in xlista:
        if(len(i)>=7):
            return True
    return False

# Ej 1.6
def es_palindromo(texto: str)->bool:
    acc: int = len(texto) - 1
    for i in texto:
        if(i!=texto[acc]):
            return False
        acc-=1
    return True

# Ej 1.7
def calidad_contrasena (pswd: str)->str:
    mayuscula : bool = False
    minuscula : bool = False
    numero    : bool = False
    long: int = len(pswd)
    for i in pswd:
        if(i>="0" and i<="9"):
            numero = True
        if(i>="a" and i<="z"):
            minuscula = True
        if(i>="A" and i<="Z"):
            mayuscula = True

    if(long<5):
        return "ROjO"
    elif(mayuscula and minuscula and numero and long>8):
        return "VERDE"
    else:
        return "AMARILLO"
    
# Ej 1.8
def control_bancario (xl: list[tuple[str,int]])->int:
    acc=0
    for i in xl:
        if(i[0]=="I"):
            acc+= i[1]
        if(i[0]=="R"):
            acc-= i[1]
    return acc

# Ej 1.9 - ZZZ

# 2.1
def reemplaza_por_cero_pares(xl: list[int])->list[int]:
    acc: int = 0
    while(acc<len(xl)):
        if(xl[acc]%2==0):
            xl[acc] = 0
        acc+=1
    return xl

# 2.2
def reem_cero_pares_sin_modificar(xl: list[int])->list[int]:
    rxl : list[int] = []
    for i in xl: 
        if(i%2==0):
            rxl.append(0)
        else:
            rxl.append(i)
    return rxl

# 2.3
def aux_es_vocal(letra:str)->str:
        return letra=="a" or letra=="e" or letra=="i" or letra=="o" or letra=="u"
            
def eliminar_vocales (xl: str)->str:
    newtxt : str = ""
    for i in xl:
        if(aux_es_vocal(i)):
            newtxt+=""
        else:
            newtxt+=i
    return newtxt

# 2.4
def reemplaza_vocales(xl: str)->str:
    res=""
    for i in xl:
        if(pertenece_global(['a','e','i','o','u'],i)):
            res+="-"
        else:
            res+=i
    return res

# 2.5
def dar_vuelta_cadena(xl:str)->str:
    res=""
    acc=len(xl)-1
    while 0<=acc:
        res+=xl[acc]
        acc-=1
    return res

# 2.6
def quitar_repetidos(xl:str)->str:
    res=""
    for i in xl:
        if(not pertenece_global(res,i)):
            res+=i
    return res

# 3.0
def son_notas_aprobadas(xl:list[int])->bool:
    for i in xl:
        if(i<4):
            return False
    return True

def aprobados (xl:list[int])->int:
    promedio : float = suma_total(xl)/len(xl)
    if(promedio>=7 and son_notas_aprobadas(xl)):
        return 1
    elif(promedio>=4 and promedio<7 and son_notas_aprobadas(xl)):
        return 2
    else:
        return 3
# 4.0

