from math import sqrt , pi

# Ej 1.1
def saludar(nombre:str)->str:
     return "Hola " + nombre

# Ej 1.2
def letra_cancion()->str:
    ltr_cancion =  "Lay Me Down in darkness \nAnd tell me what you see\nLove is where the heart is\nShow me I'm the one, tell me I'm the one that you need"
    return ltr_cancion

# Eh 1.3
def raizDe2()->float:
     x = sqrt(2)
     return round(x,4)

#  Ej 1.4
def problema_perimetro()->float:
     return 2*pi

# Ej 2.1
def imprimir_saludo(nombre:str)->str:
     print(f"Hola {nombre}")

# Ej 2.2
def  raiz_cuadrada_de(numero:int)->float:
     return sqrt(numero)

# Ej 2.3
def  fahrenheit_a_celsius(temp_f:float)->float:
     return ((temp_f-32)*5)/9

# Ej 2.4
def  es_multiplo_de(nn:int,mm:int)->bool:
     return (nn%mm)==0

# Ej 2.5
def es_par(num:int)->bool:
     return es_multiplo_de(num,2)

# Ej 2.6
"""
otra forma:
def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int)->int:
     return round((comensales*min_cant_de_porciones)/8)
"""
def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int)->int:
     y = comensales * min_cant_de_porciones
     while(not es_multiplo_de(y,8)):
          y=y+1
     return y/8

# Ej 3.1
def alguno_es0(a:int,b:int)->bool:
     return a==0 or b==0

# Ej 3.2
def ambos_son0(a:int,b:int)->bool:
     return a==0 and b==0

# Ej 3.3
def es_nombre_largo(nombre:str)->bool:
     yy = len(nombre)
     return 3<=yy and yy<=8

# Ej 3.4
def es_bisiesto(year:int)->bool:
     # return (es_multiplo_de(year,400)) or (es_multiplo_de(year,4)) and not es_multiplo_de(year,100)
     return year%400 == 0 and not (year%100==0) or year%4==0

# Ej 4.1
def peso_pino(hh:float)->float:
     if(hh<=3):
          return (hh*3)/0.01
     else:
          return 900 + ((hh-3)*2)/0.01
     
# Ej 4.mixto??
def es_peso_util(hh:float)->bool:
     peso: int= peso_pino(hh)
     if(peso>=400 and peso<=1000): 
          return True
     else:
          return False

# Ej 5.1
"""
problema  devolver_el_doble_si_es_par(numero:int)->int:
     req:{True}
     asg:{res=num   si y solo si mod num 2 /= 0}
     asg:{res=num*2 si y solo si mod num 2 == 0}
""" 
def devolver_el_doble_si_es_par(numero:int)->int:
     if(numero%2==0):
          return 2*numero
     else:
          return numero
     
# Ej 5.2
"""
problema g(num:int)->int:
     req:{true}
     asg:{res=num   si y solo si num%2==0}
     asg:{res=num+1 si y solo si num%2/=0}
"""
def devolver_valor_si_es_par_sino_el_que_sigue(numero:int)->int:
     if(numero%2==0):
          return numero
     else:
          return numero+1
     # if(numero%2==0):
     #      return numero
     # if(numero%2!=0):
     #      return numero + 1
     
# Ej 5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num:int)->int:
     if(num%3==0 and num%9==0):
          return num*2
     if(num%3!=0 and num%9==0):
          return num*3
     else:
          return num
     
     # if(num%3==0):
     #      return num*2
     # elif(num%9==0):
     #      return num*3
     # else:
     #      return num
     
# Ej 5.4
def lindo_nombre(nombre:str)->str:
     if(len(nombre)<=5):
          return "Tu nombre es muy corto"
     else:
          return "Tu nombre tiene mas de 5 letras"
     
# Ej 5.5
"""
problema g(num:int)->str:
     req:{num>0}
     asg:{res tiene como resultado una frase si num>=5 ^^ 10<=num<=100^100}
"""
def elRango(num:int)->str:
     if(num<=5):
          return "Tu numero es menor o igual a 5"
     elif(num>=10 and num<20):
          return "Tu numeor es mayor o igual a 10 y menor que 20"
     elif(num>20):
          return "Tu numero es mayor a 20"
     else:
          return "Tu numero no esta dentor de mi rango"
     
# 6.1
def imprimir1al10()->None:
     aa:int=1
     while aa<=10:
          print(aa)
          aa+=1
     
# 6.2
def imprimirEco()->None:
     aa:int=1
     while aa<=10:
          print(f"Ecoooo {aa}")
          aa+=1
     # for i in range(1,11):
     #      print("Ecooooo")

# 6.3
def countDown(num:int)->str:
     aa: int=0
     while aa<=num:
          print(num-aa)
          aa+=1
     return f"GOooo empezada desde {num}"
     # aa=num
     # while 0<=num:
     #      print(num)
     #      num-=1
     # return f"GOOOO desde {num}"

# 6.4
def timeMachine(inicio:int,fin:int)->str:
     aa: int=inicio
     while(aa>fin):
          print(f"Viajamos un anio al pasado, estamos en {aa}")
          aa-=1
     return f"FIn del viaje estamos en {fin}"

# 6.5
def timeMachineTwo(inicio:int)->str:
     aa: int=inicio
     while(aa>(-384)):
          print(f"Viajamos un anio al pasado, estamos en {aa}")
          aa-=20
     return f"FIn del viaje estamos lo mas cerca a  el 384 a.C"
     
# 7.1
def pr1al10()->None:
     for i in range(1,11,1):
          print(i)

# 7.2
def ecoooo()->None:
     for i in range(1,11,1):
          print(f"Ecoo {i}")

# 7.3
def cuentaAtras(num:int)->None:
     for i in range(num,0,-1):
          print(i)

# 7.4
def maquinaDelTiempo(inicio:int,fin:int)->str:
     for i in range(inicio,fin,-1):
          print(f"Estamos en el anio {i}")
     return f"Fin del viaje estamos en {fin}"

# 7.8
def segundaMaqTemp(inicio:int)->str:
     for i in range(inicio, -384, -20):
          print(f"Estamos en el {i}")
          fechaF = i
     return f"Esto es lo mas cerca que nos podemos acercar al 384 a.C. Estamos en {fechaF}"

print(segundaMaqTemp(100))