# Algoritmo para torre de hanoi
# Função de movimentos mínimos: M(n) = 2^n -1 

ITER = 1

n = int(input()) # quantidade de discos


def minimum_moviments(n:int):
    return (2**n) - 1


def hanoi_solve(n, origem='A', destino='C', auxiliar='B'):
    global ITER

    if n == 1:
        print(f"{ITER}. Mova {n} de {origem} para {destino}")
    else:
        hanoi_solve(n-1)
        ITER += 1
        print(f"{ITER}. Mova {n} de {origem} para {destino}")
        ITER += 1
        hanoi_solve(n-1, origem='C', destino='B', auxiliar='A')


print(f"A quantidade mínima de movimentos para solucionar a torre de Hanoi é: {minimum_moviments(n)}.")
print("São eles: ")
hanoi_solve(n)
