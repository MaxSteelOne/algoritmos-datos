ejemplo : str = "ej.txt"

# 1.1
def contar_lineas(archivo : str)->int:
    # acc : int = 0
    accion = open(archivo,"r")
    acc : int = len(accion.readlines())
    accion.close()
    return acc
    
# 1.2
def existe_palabra (palabra : str, archivo: str)->bool:
    res = False
    src = open(archivo,"r")
    xl : list[str] = src.readlines()
    src.close()
    for i in xl:
        if(palabra in i):
            res = True
    return res

# 1.3
def list_to_str(xl:list[str])->str:
    temp : str = ""
    for i in xl:
        temp+=i
    return temp

def eliminar_comentarios(archivo : str)->None:
    f1 = open(archivo,"r")
    f2 = open("resultado.txt","a")
    for linea in f1:
        dda = ""
        if("#" in linea):
            for letra in linea:
                if(letra!="#"):
                    dda+=letra
                else:
                    if(not es_vacia(dda)):
                        dda+="\n"
                        f2.write(dda)
        else:
            f2.write(linea)
    f2.close()
    f1.close() 

# 3.0
def revertir_lineas(archivo:str)->list:
    res : list[str] = []
    f1 = open(archivo,"r")
    f2 = open("resultado.txt","a")
    lista_renglones = f1.readlines()
    acc : int = len(lista_renglones)-1
    while(acc>=0):
        temp : str = lista_renglones[acc]+ "\n"
        res.append(temp)
        acc-=1
    f2.writelines(res)
    f2.close()
    f1.close()

# 4.0
def escribir_al_final(archivo:str,frase:str)->None:
    f1 = open(archivo,"w")
    f1.write(frase)
    f1.close()

zz = [1,2,3,4]
zz.append()
print(zz)