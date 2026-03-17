# 🧠 z/OS Addressing — REXX Toolkit

## Scripts REXX para Estudo e Análise de Endereçamento no IBM z/OS

Coleção de scripts REXX desenvolvidos para exploração prática dos mecanismos de **endereçamento de memória (addressing)** no ambiente IBM z/OS.

Este toolkit fornece utilitários educacionais e operacionais para análise de espaços de endereçamento, arquitetura de memória virtual e comportamento do sistema.

------

## 🎯 Objetivos

- Demonstrar conceitos de addressing no z/OS na prática
- Explorar estrutura de address spaces
- Auxiliar no entendimento da memória virtual
- Fornecer ferramentas para análise técnica e educacional
- Apoiar troubleshooting e estudos avançados de arquitetura

------

## 👥 Público-Alvo

- Sysprogs z/OS
- Storage Administrators
- Analistas de Performance
- Programadores de sistemas
- Estudantes avançados de Mainframe
- Profissionais interessados na arquitetura IBM Z

------

## 🧠 Pré-requisitos

Recomendado:

- Conhecimento de arquitetura z/OS
- Noções de virtual storage e address spaces
- Familiaridade com TSO/ISPF
- Entendimento básico de conceitos como:
  - Espaço de endereçamento
  - Memória virtual vs. real
  - Paging e swapping
  - Subpools de storage

------

## ⚙️ Funcionalidades do Toolkit

Os scripts podem incluir funcionalidades como:

✔ Consulta de address spaces ativos
 ✔ Análise de regiões de memória
 ✔ Exploração de estruturas de armazenamento
 ✔ Demonstração de limites de endereçamento
 ✔ Apoio a estudos sobre arquitetura de memória
 ✔ Diagnóstico técnico de comportamento do sistema
 ✔ Relatórios educacionais sob demanda

------

## 📂 Conteúdo da Pasta

A pasta contém múltiplos scripts REXX numerados sequencialmente:

```
script001.rexx
script002.rexx
script003.rexx
...
script028.rexx
```

Cada script aborda um aspecto específico relacionado ao endereçamento no z/OS.

------

## 🚀 Como Executar os Scripts

### ▶️ Execução Interativa (TSO/ISPF)

Se os scripts estiverem em um dataset alocado em SYSEXEC ou SYSPROC:

```
TSO script001
```

ou

```
EXEC 'USER.REXX.LIB(script001)'
```

------

### ▶️ Execução em Batch (JCL)

Utilizando IKJEFT01:

```
//ADDRJOB JOB CLASS=A,MSGCLASS=X
//STEP1   EXEC PGM=IKJEFT01
//SYSEXEC DD DISP=SHR,DSN=USER.REXX.LIB
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  %SCRIPT001
/*
```

------

## 🧩 Integração com z/OS

Os scripts podem interagir com componentes relacionados à memória e execução:

- Address Spaces
- Virtual Storage Manager (VSM)
- Data Spaces e Hiperspaces
- TSO/E comandos
- SDSF
- Subsystems do z/OS

------

## 📊 Casos de Uso

Este toolkit é especialmente útil para:

- Estudos avançados de arquitetura z/OS
- Treinamento de sysprogs e storage admins
- Investigação de comportamento de memória
- Preparação para certificações técnicas
- Laboratórios educacionais
- Análise pós-incidente relacionada a memória

------

## ⚠️ Considerações Operacionais

- Alguns scripts podem exigir permissões elevadas
- Recomenda-se execução em ambiente de testes
- Resultados podem variar conforme a versão do z/OS
- Consulte políticas de segurança antes do uso em produção

------

## 🏆 Benefícios

✔ Compreensão aprofundada do modelo de memória do z/OS
 ✔ Ferramentas práticas para análise técnica
 ✔ Material valioso para treinamento avançado
 ✔ Apoio ao diagnóstico de problemas complexos
 ✔ Visão interna do funcionamento do sistema

------

## 📚 Sobre Addressing no z/OS

O z/OS utiliza um sofisticado modelo de endereçamento baseado em memória virtual, permitindo a execução simultânea de milhares de workloads com isolamento e eficiência.

Entre os principais conceitos envolvidos:

- Address Spaces
- Espaços de 24, 31 e 64 bits
- Regiões de usuário e sistema
- Paging e gerenciamento de memória
- Estruturas de controle do sistema

------

## 🧪 Uso Educacional

Este conjunto de scripts é ideal para:

- Cursos avançados de Mainframe
- Workshops técnicos
- Laboratórios de arquitetura
- Capacitação profissional
- Autoestudo aprofundado

------

## 📜 Licença

Uso livre, desde que deixe uma estrela no repositório e cite o autor.

------

## 👨‍💻 Autor

**Vagner Bellacosa**
 Especialista em IBM Mainframe
 Instrutor e evangelizador da Stack Mainframe