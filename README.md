# Algoritmo Resolução Torre de Hanoi

### Sobre o Repositório
Exercício da disciplina de ACSO, onde foi pedido que aplicassemos o algoritmo de resolução da torre de hanoi em Assembly. Note que existe um arquivo {main.py}, este representa a resolução do algoritmo numa linguagem de alto nível para o melhor entendimento do algoritmo, tendo em vista que códigos em assembly são pouco legíveis.

### Sobre a Torre de Hanoi
Consiste num famoso problema matemático e de lógica que foi proposto pelo matemático francês Édouard Lucas em 1883. O problema envolve três torres e um número qualquer de discos de tamanhos diferentes. A tarefa é mover todos os discos de uma torre para outra, respeitando um conjunto de regras:

1. Mover apenas um disco por vez.
2. Somente o disco superior de uma torre pode ser movido.
3. Um disco maior nunca pode ser colocado sobre um disco menor.
4. Você tem que mover todos os discos de uma torre para outra, utilizando uma torre auxiliar como "ajuda", se necessário.

### Sobre o algoritmo
Basicamente, o algoritmo funciona de forma recursiva, onde vamos reduzindo a resolução em problemas menores **(n-1)**. No caso trivial, **N = 1**, movemos o único disco para a torre de destino. O código recebe um valor **N** de discos, a partir disso, calculamos a quantidade mínima de movimentos que podemos realizar para completar o jogo. Esse cálculo é feito utilizando a seguinte função **M(n) = 2^n - 1**. Onde **M(n)** é a quantidade de movimentos.

### Alunos responsáveis pelo algoritmo:
- Jorge Guilherme
- Silas Manoel
