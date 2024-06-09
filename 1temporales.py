from queue import LifoQueue as Pila
import random

#pp.put() agregar un elemento al inicio de la pila
#elemento = pp.get() desapilar y asignando el valor a una variable
#pp.empty() verifica si esta vacia


def generarNrosAzar(cantidad:int, desde:int, hasta:int)-> Pila: 
    acc : int=0
    miPila = Pila()
    while(acc<cantidad):
        miPila.put(random.randint(desde,hasta))
        acc+=1
    return miPila

#print(generarNrosAzar(5,0,20).queue)

#recordar probar por recur !!!!!!!!!!!!!!!!!!!!!!!!!!
def buscarMaximo(miPila: Pila[int])-> int:
    print(miPila.queue)
    pilaTemp = Pila()
    maximo: int = miPila.get()
    pilaTemp.put(maximo)
    while(not miPila.empty()):
        tope = miPila.get()
        pilaTemp.put(tope)
        if(tope > maximo):
            maximo = tope
    while(not pilaTemp.empty()):
        miPila.put(pilaTemp.get())
    print(miPila.queue)
    return maximo


        
print(buscarMaximo(generarNrosAzar(10,0,100)))



"""ARCHIVOS"""

def contarLineas(nmArchivo:str)-> int:
    ls = open(nmArchivo,"r") 
    contenido = ls.readlines()
    ls.close()
    return len(contenido)

print(contarLineas("miarc.txt"))
