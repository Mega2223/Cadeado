# Mega2223/Cadeado

Esse é o meu código para o meu projeto final da matéria de Sistemas Digitais, um código VHDL que implementa um cadeado sequencial que reconhece a sequência binária "1101", com implementações do modelo de Moore e no modelo de Mealy.   

Eu também inclui todas as simulações no projeto (e saíram alguns arquivos residuais também, perdão :p).

## Estrutura

```
Raiz  
|- Wave          <-- Implementações ingênuas para rodar no GHDL e testar no GTKWave   
|- |- 4 Estados   <-- Códigos da máquina de Mealy (só precisa de 4 estados)   
|- |- 5 Estados   <-- Códigos da máquina de Moore (precisa de 5 estados)   
|- Placa         <-- Implementações para a placa DE10-Lite Altera   
|- |- 4 Estados   <-- Códigos da máquina de Mealy (só precisa de 4 estados)   
|- |- 5 Estados   <-- Códigos da máquina de Moore (precisa de 5 estados)
```

Todo o código do projeto está licenciado sob a GNU salvo indicação ao contrário
