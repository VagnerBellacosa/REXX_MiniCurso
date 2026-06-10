# ☕💣🚀 IMS Database Administration Toolkit

## Monitoramento, Troubleshooting e Automação IMS com REXX

Coleção de exemplos REXX voltados para administradores IMS, DBAs IMS, Sysprogs e equipes de Operações Mainframe.

O objetivo deste projeto é demonstrar como utilizar REXX para automatizar tarefas de monitoramento, auditoria, troubleshooting e health checks em ambientes IMS Database.

------

# Visão Geral

O IMS continua sendo um dos bancos de dados mais importantes do mundo corporativo, processando bilhões de transações diariamente em bancos, seguradoras, empresas de cartão de crédito, telecomunicações e órgãos governamentais.

Em ambientes de grande porte é inviável realizar todas as verificações manualmente.

Por isso, REXX tornou-se uma ferramenta fundamental para:

- Monitoramento operacional
- Capacity Planning
- Auditoria
- Troubleshooting
- Health Check
- Automação
- RCA (Root Cause Analysis)
- Governança IMS

------

# Conteúdo

Este laboratório contém 10 exemplos práticos.

| Script      | Objetivo                   |
| ----------- | -------------------------- |
| CHECKSTOP   | Detectar databases em STOP |
| CHECKIC     | Verificar Image Copies     |
| CHECKRECON  | Auditoria de RECON         |
| CHECKFP     | Monitorar áreas Fast Path  |
| CHECKBACKUP | Validar backups            |
| CHECKBUFFER | Health Check de Buffers    |
| CHECKRECOV  | Detectar Recovery Needed   |
| CHECKSPACE  | Capacity Planning          |
| COMPAREDBD  | Comparar DBDLIBs           |
| HEALTHCHK   | Dashboard consolidado      |

------

# Estrutura do Projeto

```text
IMS-REXX-TOOLKIT
|
+-- CHECKSTOP.REXX
+-- CHECKIC.REXX
+-- CHECKRECON.REXX
+-- CHECKFP.REXX
+-- CHECKBACKUP.REXX
+-- CHECKBUFFER.REXX
+-- CHECKRECOV.REXX
+-- CHECKSPACE.REXX
+-- COMPAREDBD.REXX
+-- HEALTHCHK.REXX
|
+-- docs
|
+-- README.md
```

------

# Script 1 - Detectar Databases em STOP

## Objetivo

Identificar bancos indisponíveis.

```rexx
ADDRESS TSO

"QUERY DB ALL"

DO WHILE QUEUED() > 0
   PULL LINHA

   IF POS("STOPPED",LINHA) > 0 THEN
      SAY "ALERTA ->" LINHA
END
```

## Benefícios

- Disponibilidade
- Monitoramento pró-ativo
- Redução de incidentes

------

# Script 2 - Verificar Image Copies

## Objetivo

Validar a existência de backups recentes.

```rexx
ADDRESS TSO

"LISTCAT LEVEL(IMS.IC)"
```

## Benefícios

- Segurança operacional
- Compliance
- Recuperação de desastres

------

# Script 3 - Auditoria de RECON

## Objetivo

Detectar inconsistências DBRC.

```rexx
ADDRESS TSO

"DBRC LIST.RECON"
```

## Benefícios

- Integridade de Recovery
- Auditoria preventiva

------

# Script 4 - Monitoramento Fast Path

## Objetivo

Identificar crescimento excessivo.

```rexx
ADDRESS TSO

"DBRC LIST.DB DBD(FPDB001)"
```

## Benefícios

- Planejamento de reorganizações
- Evitar overflow

------

# Script 5 - Validação de Image Copies

## Objetivo

Detectar bancos sem backup.

```rexx
ADDRESS TSO

"DBRC LIST.IC"
```

## Benefícios

- Proteção contra perda de dados

------

# Script 6 - Health Check de Buffers

## Objetivo

Avaliar desempenho.

```rexx
ADDRESS TSO

"QUERY BUFPOOL"
```

## Indicadores

- Hit Ratio
- Miss Ratio
- Wait Time

------

# Script 7 - Recovery Needed

## Objetivo

Detectar databases aguardando recuperação.

```rexx
ADDRESS TSO

"DBRC LIST.DB ALL"
```

## Benefícios

- Redução de indisponibilidade

------

# Script 8 - Capacity Planning

## Objetivo

Monitorar crescimento.

```rexx
ADDRESS TSO

"LISTCAT LEVEL(PROD.IMS.DB)"
```

## Benefícios

- Planejamento de storage
- Previsão de expansão

------

# Script 9 - Comparação de DBDLIB

## Objetivo

Detectar diferenças entre ambientes.

```rexx
ADDRESS TSO

"SUPERC COMPARE PROD.DBDLIB TEST.DBDLIB"
```

## Benefícios

- Controle de mudanças
- Governança

------

# Script 10 - Dashboard IMS

## Objetivo

Gerar resumo consolidado.

```rexx
CALL CHECKDB
CALL CHECKIC
CALL CHECKRECON
CALL CHECKSPACE
```

## Benefícios

- Visão executiva
- Operação simplificada

------

# Próximos Passos

Expandir os scripts para integração com:

- IMS Catalog
- IMS Managed ACB
- IMS Directory
- DBRC APIs
- OM API
- RM API
- SCI
- SDSF
- RMF
- SMF
- RACF
- Zowe

------

# Ambiente Recomendado

- z/OS 2.5+
- IMS 15.4+
- DBRC habilitado
- ISPF
- TSO/E
- REXX
- SDSF

------

# Casos de Uso Reais

- Bancos
- Seguradoras
- Processadoras de Cartão
- Telecomunicações
- Governo
- Empresas com ambientes IMS de missão crítica

------

# Filosofia Bellacosa Mainframe

> "Quem administra IMS apenas pelo ISPF enxerga uma parte do ambiente. Quem domina REXX transforma o IMS em uma plataforma autônoma de monitoramento, prevenção de incidentes e troubleshooting."

------

# Licença

Uso educacional e laboratorial.

Adapte os exemplos para os padrões e requisitos de sua organização.