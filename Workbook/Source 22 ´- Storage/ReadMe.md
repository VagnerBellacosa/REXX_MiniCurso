# 💾 z/OS Storage Manager — REXX Toolkit

## Automação, Monitoramento e Diagnóstico de Storage no IBM z/OS

Coleção de scripts REXX voltados para administração, monitoramento e troubleshooting de **Storage Management** no ambiente IBM z/OS.

Este toolkit fornece utilitários práticos para análise de memória, controle de recursos, identificação de problemas de armazenamento e suporte a operações de produção.

------

## 🎯 Objetivos

- Automatizar tarefas de administração de storage
- Monitorar uso de memória e recursos do sistema
- Auxiliar no diagnóstico de problemas de storage
- Apoiar troubleshooting de performance
- Fornecer ferramentas operacionais para sysprogs
- Facilitar estudos sobre gerenciamento de memória no z/OS

------

## 👥 Público-Alvo

- Storage Administrators
- Sysprogs z/OS
- Analistas de Performance
- Operadores de Mainframe
- Especialistas em Capacity Planning
- Profissionais de suporte de produção

------

## 🧠 Pré-requisitos

Recomendado:

- Conhecimento de arquitetura z/OS
- Noções de virtual storage e address spaces
- Familiaridade com TSO/ISPF
- Acesso a comandos operacionais e utilitários do sistema
- Permissões adequadas para consulta de recursos

------

## ⚙️ Funcionalidades do Toolkit

Os scripts podem oferecer funcionalidades como:

✔ Monitoramento de uso de memória por address space
 ✔ Verificação de consumo de storage virtual e real
 ✔ Análise de subpools e áreas de armazenamento
 ✔ Identificação de possíveis leaks ou pressão de memória
 ✔ Consulta de limites e utilização de recursos
 ✔ Apoio à análise de desempenho
 ✔ Diagnóstico de condições anormais
 ✔ Relatórios operacionais sob demanda

------

## 📂 Conteúdo da Pasta

A pasta contém aproximadamente **40 scripts REXX**, numerados sequencialmente:

```
script002.rexx
script003.rexx
...
script040.rexx
```

Cada script foi desenvolvido para executar uma tarefa específica relacionada à administração de storage no z/OS.

------

## 🚀 Como Executar os Scripts

### ▶️ Execução Interativa (TSO/ISPF)

Se os scripts estiverem alocados em SYSEXEC ou SYSPROC:

```
TSO script002
```

ou

```
EXEC 'USER.REXX.LIB(script002)'
```

------

### ▶️ Execução em Batch (JCL)

Utilizando IKJEFT01:

```
//STRGJOB JOB CLASS=A,MSGCLASS=X
//STEP1   EXEC PGM=IKJEFT01
//SYSEXEC DD DISP=SHR,DSN=USER.REXX.LIB
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  %SCRIPT002
/*
```

------

## 🧩 Integração com z/OS

Os scripts podem interagir com diversos componentes do sistema:

- Virtual Storage Manager (VSM)
- Address Spaces
- Data Spaces e Hiperspaces
- TSO/E comandos
- RMF / SMF
- SDSF
- Subsystems do z/OS

------

## 📊 Casos de Uso

Este toolkit pode ser utilizado para:

- Monitoramento de memória do sistema
- Investigação de degradação de performance
- Diagnóstico de storage constraints
- Análise pós-incidente
- Capacity planning
- Suporte a plantão operacional
- Laboratórios e treinamento técnico

------

## ⚠️ Considerações Operacionais

- Alguns scripts podem exigir privilégios elevados
- Recomenda-se validação em ambiente de testes antes do uso em produção
- Resultados podem variar conforme versão do z/OS e configuração do sistema
- Consulte políticas de segurança locais antes da execução

------

## 🏆 Benefícios

✔ Redução do tempo de diagnóstico
 ✔ Maior visibilidade do uso de memória
 ✔ Automação de tarefas repetitivas
 ✔ Apoio a decisões de tuning
 ✔ Ferramentas práticas para operações críticas

------

## 📚 Sobre Storage Management no z/OS

O gerenciamento de storage no z/OS envolve múltiplos níveis de memória virtual e real, incluindo:

- Áreas de usuário e sistema
- Subpools de storage
- Paging e swapping
- Controle de recursos por address space
- Otimização de desempenho

Uma administração eficiente é essencial para a estabilidade e disponibilidade do ambiente.

------

## 🧪 Uso Educacional

Além do uso operacional, os scripts podem servir para:

- Treinamento de Storage Admins
- Estudos sobre arquitetura de memória do z/OS
- Laboratórios técnicos avançados
- Capacitação em troubleshooting

------

## 📜 Licença

Uso livre, desde que deixe uma estrela no repositório e cite o autor.

------

## 👨‍💻 Autor

**Vagner Bellacosa**
 Especialista em IBM Mainframe
 Instrutor e evangelizador da Stack Mainframe