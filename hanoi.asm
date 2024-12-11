section .text                         ; Usada para armazenar o executável

    global _start                     ; start do código

    _start:
        push ebp                      ; empilha o registrador
        mov ebp, esp                  ; aponta o ponteiro do topo da pilha (nosso registrador)
        
        mov eax, 3                    ; Setando o número de discos

        ; Empurrando as torres e a quantidade de discos na pilha de referencia para que fiquem em ordem
        
        push dword 3                  ; Torre C
        push dword 2                  ; Torre B
        push dword 1                  ; Torre A
       
        push eax                      ; qtd de discos

        call hanoi                    ; Chamando o rótulo Hanoi

        ; Gerando uma interrupçao para a finalizaçao do programa
        mov eax, 1                    ; Parametro de saida do sistema
        mov ebx, 0                    ; Parametro para utilizar a saida padrão  
        int 128                       ; Interrupção do Kernel


; Rótulos do codigo
    hanoi:
        ;[ebp+8] qtd de discos restantes em A
        ;[ebp+12] = Torre A
        ;[ebp+16] = Torre B
        ;[ebp+20] = Torre C

        push ebp                      ; empilha o registrador
        mov ebp,esp                   ; aponta o ponteiro do topo da pilha (nosso registrador)

        mov eax, [ebp+8]              ; move para o registrador ax o numero de discos
       
        cmp eax, 0                    ; verifica se Ainda há disco a ser movido na torre de origem
        je desempilhar                ; caso nao tenha nunhum disco, desempilha
       
        ; primeira recursividade    
        push dword [ebp+16]           ; Empurra a torre Auxiliar
        push dword [ebp+20]           ; Empurra a torre Destino
        push dword [ebp+12]           ; Empurra a torre Origem
       
        dec eax                       ; move o disco da torre de origem para outra torre
        push dword eax                ; empurra o numero de discos restantes a serem movidos na Torre de origem
       
        call hanoi                    ; chama o rótulo hanoi para guardar a linha de recursao
       
        add esp,16                    ; após retornar da chamada do rótulo hanoi, remove o "lixo" da pilha

        ; Printando os movimentos
        push dword [ebp+16]           ; empilha o torre de Saida
        push dword [ebp+12]           ; empilha o torre de Ida
        push dword [ebp+8]            ; empilha o disco
       
        call imprime                  ; imprimindo os movimentos
       
        add esp, 12                   ; após retornar da chamada do rótulo hanoi, remove o "lixo" da pilha
    
        ; segunda recursividade
        push dword [ebp+12]           ; empilha a torre A
        push dword [ebp+16]           ; empilha a torre B
        push dword [ebp+20]           ; empilha a torre C
       
        mov eax, [ebp+8]              ; move para o registrador eax o número de discos restantes
       
        dec eax                       ; move o disco da torre de origem para outra torre
        push dword eax                ; empurra o numero de discos restantes a serem movidos na Torre de origem
   
        call hanoi                    ; chama o rótulo hanoi para guardar a linha de recursao
    desempilhar:

        mov esp, ebp                  ; aponta o ponteiro da base da pilha (ebp) para o topo
        pop ebp                       ; tira o elemento do topo da pilha e guarda o valor em ebp
        ret                           ; retira o ultimo valor do topo da pilha e da um jump para ele
    imprime:
        push ebp                      ; empurra o registrador ebp na pilha (para ser a base)
        mov ebp, esp                  ; aponta o ponteiro do topo da pilha (esp) para a base
       
        mov eax, [ebp + 8]            ; coloca no registrador ax o disco a ser movido
        add al, 48                    ; conversao na tabela ASCII
        mov [disco], al               ; coloca o valor no [disco] para o print

        mov eax, [ebp + 12]           ; coloca no registrador ax a torre de onde o disco saiu
        add al, 64                    ; conversao na tabela ASCII
        mov [torre_saida], al         ; coloca o valor no [torre_saida] para o print

        mov eax, [ebp + 16]           ; coloca no registrador ax a torre de onde o disco foi
        add al, 64                    ; conversao na tabela ASCII
        mov [torre_ida], al           ; coloca o valor no [torre_ida] para o print

        mov edx, lenght               ; tirando o len da msg
        mov ecx, msg                  ; msg
        mov ebx, 1                    ; dá permissão para a saida
        mov eax, 4                    ; informa que será uma escrita
        int 128                       ; Interrupção para kernel

        mov     esp, ebp              ; aponta o ponteiro da base da pilha (ebp) para o topo
        pop     ebp                   ; tira o elemento do topo da pilha e guarda o valor em ebp
        ret                           ; retira o ultimo valor do topo da pilha e da um jump para ele

    section .data                         ; Usada para armazenar dados inicializados do programa

    ; Modelo de saída
    msg:
                          db        "disc: "  
        disco:            db        " "
                          db        "   "                      
        torre_saida:      db        " "  
                          db        " -> "    
        torre_ida:        db        " ", 0xa  ; \n
       
        lenght            equ       $-msg