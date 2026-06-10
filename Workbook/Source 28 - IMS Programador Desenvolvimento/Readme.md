# ☕💣🚀 IMS REXX Developer Toolkit

## Operações CRUD e Navegação IMS Database para Desenvolvedores COBOL

Coleção de exemplos REXX para auxiliar desenvolvedores COBOL na manutenção de databases IMS.

O objetivo deste laboratório é demonstrar como automatizar consultas, pesquisas, inserções, atualizações e exclusões em bancos IMS através de scripts REXX.

------

# Público Alvo

- Desenvolvedores COBOL IMS DB
- Desenvolvedores COBOL IMS DB/DC
- Analistas de Produção
- Suporte Aplicacional
- DBA IMS
- Sysprog IMS

------

# Estrutura

```text
IMS-REXX-DEVELOPER-TOOLKIT

READKEY.REXX
READNEXT.REXX
READALL.REXX
INSERT.REXX
UPDATE.REXX
DELETE.REXX
POSITION.REXX
SCANDB.REXX
MASSUPDATE.REXX
VERIFY.REXX

README.md
```

------

# Database Exemplo

Segmento Cliente

```text
CLIENTE
|
+-- CODCLI
+-- NOME
+-- CIDADE
+-- LIMITE
```

------

# Script 1 - READKEY.REXX

## Ler um registro por chave

Equivalente COBOL

```cobol
CALL 'CBLTDLI'
USING GU
      PCB
      AREA
      SSA.
```

REXX

```rexx
ADDRESS IMS

"GU CLIENTE CODCLI=1001"

IF RC = 0 THEN
   SAY IMSDATA
ELSE
   SAY "NAO ENCONTRADO"
```

------

# Script 2 - READNEXT.REXX

## Ler próximo registro

Equivalente

```cobol
GN
```

REXX

```rexx
ADDRESS IMS

"GN CLIENTE"

IF RC = 0 THEN
   SAY IMSDATA
```

------

# Script 3 - READALL.REXX

## Ler todos os registros

```rexx
ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   SAY IMSDATA

END
```

------

# Script 4 - INSERT.REXX

## Inserir registro

Equivalente

```cobol
ISRT
```

REXX

```rexx
ADDRESS IMS

"ISRT CLIENTE",
"CODCLI=2001",
"NOME=JOAO",
"CIDADE=SAO PAULO"

IF RC = 0 THEN
   SAY "INSERIDO"
```

------

# Script 5 - UPDATE.REXX

## Atualizar registro

Equivalente

```cobol
GHU
REPL
```

REXX

```rexx
ADDRESS IMS

"GHU CLIENTE CODCLI=2001"

IF RC = 0 THEN
DO

   "REPL CLIENTE LIMITE=15000"

END
```

------

# Script 6 - DELETE.REXX

## Excluir registro

Equivalente

```cobol
GHU
DLET
```

REXX

```rexx
ADDRESS IMS

"GHU CLIENTE CODCLI=2001"

IF RC = 0 THEN
DO

   "DLET CLIENTE"

END
```

------

# Script 7 - POSITION.REXX

## Posicionar numa chave específica

```rexx
ADDRESS IMS

"GU CLIENTE CODCLI=5000"

IF RC = 0 THEN
   SAY "POSICIONADO"
```

------

# Script 8 - SCANDB.REXX

## Localizar registros por cidade

```rexx
ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   IF POS("CAMPINAS",IMSDATA) > 0 THEN
      SAY IMSDATA

END
```

------

# Script 9 - MASSUPDATE.REXX

## Atualização em massa

Aumentar limite em 10%

```rexx
ADDRESS IMS

"GU CLIENTE"

DO FOREVER

   "GHN CLIENTE"

   IF RC <> 0 THEN
      LEAVE

   NOVO = LIMITE * 1.10

   "REPL CLIENTE LIMITE="NOVO

END
```

------

# Script 10 - VERIFY.REXX

## Verificar existência

```rexx
ADDRESS IMS

"GU CLIENTE CODCLI=1001"

IF RC = 0 THEN
   SAY "EXISTE"
ELSE
   SAY "NAO EXISTE"
```

------

# Equivalência COBOL x REXX

| COBOL DL/I | REXX |
| ---------- | ---- |
| GU         | GU   |
| GN         | GN   |
| GHU        | GHU  |
| GHN        | GHN  |
| ISRT       | ISRT |
| REPL       | REPL |
| DLET       | DLET |

------

# Casos de Uso

## Correção Emergencial

Atualizar um cliente.

## Auditoria

Verificar registros específicos.

## Pesquisa

Localizar ocorrências.

## Migração

Preparar dados.

## Testes

Validar alterações.

------

# Evoluções Futuras

- IMS Catalog
- IMS Managed ACB
- IMS Connect
- z/OS Connect
- APIs REST
- DBRC
- Batch Automation
- JSON para IMS
- Integração COBOL + REXX

------

# Filosofia Bellacosa Mainframe

"Um desenvolvedor COBOL conhece GU, GN, ISRT e REPL. Um especialista IMS sabe automatizar essas operações em larga escala utilizando REXX, transformando horas de trabalho manual em poucos segundos de execução."