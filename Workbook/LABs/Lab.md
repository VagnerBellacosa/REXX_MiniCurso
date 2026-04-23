# 🚀 VISÃO GERAL (IMPORTANTÍSSIMO)

O curso segue uma progressão clara:

| Fase | Objetivo              |
| ---- | --------------------- |
| 1–2  | Setup + fundamentos   |
| 3–4  | Lógica + loops        |
| 5–6  | Funções               |
| 7–8  | Modularização + erros |
| 9–10 | I/O + sistema         |
| 11+  | Batch + avançado      |

💣 Insight:
 👉 Isso é praticamente um “bootcamp de automação mainframe”

------

# 🧪 SCRIPT 1 — (EX1 não tem código)

👉 Apenas ambiente (ISPF + SYSEXEC)

------

# 🧪 SCRIPT 2 — MATH1 (Exercício 2)

```
/* REXX */
say "Digite dois números:"
parse pull a b

say "Você digitou:" a "e" b

say a "+" b "=" a + b
say a "-" b "=" a - b
say a "*" b "=" a * b
say a "/" b "=" a / b

say a "dividido por" b "é" a % b "resto" a // b
```

## 🧠 Explicação

- `parse pull` → lê teclado
- `/` → divisão decimal
- `%` → divisão inteira
- `//` → resto

💣 Insight:
 👉 Aqui nasce o padrão de input/output do curso inteiro

------

# 🧪 SCRIPT 3 — MATH2 (Exercício 3)

```
/* REXX */
parse arg a b

if a = "" | b = "" then do
   say "Digite dois números:"
   parse pull a b
end

say "Você digitou:" a b

say a "+" b "=" a + b
say a "-" b "=" a - b
say a "*" b "=" a * b

if b = 0 then
   say "Divisão não pode ser feita"
else do
   say a "/" b "=" a / b
   say a "dividido por" b "é" a % b "resto" a // b
end
```

## 🧠 Conceitos

- `parse arg` → argumentos de linha
- fallback para input
- validação de divisão

------

# 🧪 SCRIPT 4 — MYMATH

```
/* REXX */
say "Operação (add/sub/mul/div):"
parse pull op

say "Digite dois números:"
parse pull a b

select
  when op = "add" then say a+b
  when op = "sub" then say a-b
  when op = "mul" then say a*b
  when op = "div" then do
       if b = 0 then say "Erro"
       else say a/b
  end
  otherwise say "Operação inválida"
end
```

💣 Insight:
 👉 `SELECT` substitui vários IFs

------

# 🧪 SCRIPT 5 — MATH3 (loops)

```
/* REXX */
do forever
   say "Digite dois números ou EXIT:"
   parse pull a b

   if a = "EXIT" then leave

   if b = "" then do
      say "Entrada inválida"
      iterate
   end

   say a+b
end

say "Fim"
```

## 🧠 Conceitos

- `do forever`
- `leave`
- `iterate`

------

# 🧪 SCRIPT 6 — MYMATH2

```
/* REXX */
do forever
   say "Operação ou EXIT:"
   parse pull op

   if op = "exit" then leave

   if op ¬= "add" & op ¬= "sub" & op ¬= "mul" & op ¬= "div" then do
      say "Inválido"
      iterate
   end

   say "Digite números:"
   parse pull a b

   select
     when op="add" then say a+b
     when op="sub" then say a-b
     when op="mul" then say a*b
     when op="div" then if b=0 then say "Erro"; else say a/b
   end
end
```

------

# 🧪 SCRIPT 7 — FUNLAB (funções básicas)

```
/* REXX */
say length("Bellacosa")
say substr("Mainframe",1,4)
say datatype("123","N")
say datatype("ABC","N")
```

------

# 🧪 SCRIPT 8 — MATH4 (validação + data)

```
/* REXX */
do forever
   say "Digite números ou EXIT:"
   parse pull a b

   if a="exit" then leave

   if datatype(a,"N")=0 | datatype(b,"N")=0 then do
      say "Erro: não numérico"
      iterate
   end

   say time() date()
   say a+b
end
```

💣 Insight:
 👉 `datatype()` é ESSENCIAL em produção

------

# 🧪 SCRIPT 9 — MYMATH3 (abreviações)

```
/* REXX */
do forever
   say "Op:"
   parse pull op

   op = abbrev("ADD",op) | abbrev("SUB",op) | abbrev("MUL",op) | abbrev("DIV",op)

   say op
end
```

------

# 🧪 SCRIPT 10 — SUMMIT

```
/* REXX */
call soma 10 20
exit

soma:
parse arg a b
say a+b
return
```

------

# 🧪 SCRIPT 11 — AVG

```
/* REXX */
call avg 10 20

avg:
parse arg a b
say (a+b)/2
return
```

------

# 🧪 SCRIPT 12 — ERROR HANDLING

```
/* REXX */
signal on error

x = 5/0

exit

error:
say "Erro detectado"
exit
```

------

# 🧪 SCRIPT 13 — STEM + STACK

```
/* REXX */
do i=1 to 3
  pull dados.i
end

do i=1 to 3
  say dados.i
end
```

------

# 🧪 SCRIPT 14 — HOST COMMAND

```
/* REXX */
address tso
"LISTDS"
```

------

# 🧪 SCRIPT 15 — EXECIO

```
/* REXX */
"ALLOC FI(IN) DA('USER.TEST') SHR"
"EXECIO * DISKR IN (STEM DADOS."
"FREE FI(IN)"

do i=1 to dados.0
 say dados.i
end
```

------

# 🧪 SCRIPT 16 — BATCH REXX

(JCL)

```
//STEP1 EXEC PGM=IKJEFT01
//SYSTSIN DD *
  %MATH1
/*
```

------

# 🧪 SCRIPT 17 — PARSE AVANÇADO

```
/* REXX */
linha = "A B C D"
parse var linha a b c d
say c
```

------

# 🧪 SCRIPT 18 — CALCUL8R (final)

```
/* REXX */
do forever
   say "Expr ou EXIT:"
   parse pull linha

   if linha="exit" then leave

   interpret "res="linha
   say res
end
```

💣 Insight:
 👉 `INTERPRET` = poder absurdo (e perigoso)

------

# 🧠 CONCLUSÃO (ANÁLISE DO CURSO)

O documento não é só um curso…

👉 Ele constrói uma jornada:

1. Entrada (I/O)
2. Lógica
3. Controle
4. Modularização
5. Integração com sistema
6. Automação real

💥 Resultado final:
 Você sai capaz de:

- automatizar operações z/OS
- criar ferramentas internas
- integrar com utilitários
- escrever soluções reais