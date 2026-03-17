# 📘 REXX MiniCurso — Workbook Prático de REXX no Mainframe

Um guia completo e progressivo para aprendizado da linguagem **REXX (Restructured Extended Executor)** no ambiente IBM Mainframe, com foco prático em automação, administração de sistemas z/OS e integração com ferramentas corporativas.

Este workbook foi projetado para uso em treinamentos, autoestudo ou capacitação profissional.

------

## 🎯 Objetivos do Curso

- Ensinar REXX do nível básico ao avançado
- Demonstrar uso real em ambientes z/OS
- Capacitar operadores, programadores e sysprogs
- Explorar automação e integração com subsistemas
- Desenvolver scripts úteis para operações diárias

------

## 👥 Público-Alvo

- Iniciantes em Mainframe
- Operadores z/OS
- Programadores COBOL / PL/I
- Administradores de sistema
- Estudantes e entusiastas de tecnologia IBM Z
- Profissionais que desejam automatizar tarefas via TSO/ISPF

------

## 🧠 Pré-requisitos

Recomendado (não obrigatório):

- Conhecimentos básicos de TSO/ISPF
- Noções de JCL
- Familiaridade com conceitos de z/OS
- Acesso a ambiente Mainframe ou emulador (ex.: Hercules)

------

## 🗂️ Estrutura do Workbook

O curso está organizado em módulos progressivos:

### 🔰 Fundamentos e Ambiente

- **Source 1 — Marist**
- **Source 2 — Hercules**
- **Source 3 — z/OS / zPlex**
- **Source 4 — Regina REXX**

Introdução ao ambiente, execução e variantes da linguagem.

------

### 📐 Sintaxe e Conceitos Básicos

- **Source 05 — Introdução**
- **Source 06 — Coding Rules**
- **Source 07 — Operadores**
- **Source 08 — Variáveis**
- **Source 09 — Conversão de Dados**

Fundamentos da linguagem REXX.

------

### ⚙️ Interação com z/OS

- **Source 10 — z/OS System Monitor**
- **Source 11 — Funções e Subrotinas**
- **Source 12 — Debug**
- **Source 13 — TSO/E**
- **Source 14 — UNIX System Services**
- **Source 15 — Outros Ambientes**

Uso real dentro do sistema operacional.

------

### 🌐 Integrações e Automação

- **Source 16 — Host Commands**
- **Source 17 — RACF**
- **Source 18 — Ansible**
- **Source 19 — Dashboard IA SMF/WLM**

Automação corporativa e integração com ferramentas modernas.

------

### 🏗️ Tópicos Avançados

- **Source 20 — Capacity Planning (R4HA)**
- **Source 21 — Endereçamento**
- **Source 22 — Storage**

Análise de performance, memória e recursos do sistema.

------

## 📂 Diretórios Especiais

### 📁 JCL

Contém exemplos de JCL para execução de scripts REXX em batch.

------

### 📄 Arquivos Markdown

- **ReginaRexx.md** — Informações sobre a implementação Regina REXX
- **Readme.md** — Este documento

------

## 🚀 Como Executar Scripts REXX

### ▶️ Em TSO/ISPF

```
TSO EXEC 'dataset(nome_do_script)'
```

ou

```
TSO nome_do_script
```

------

### ▶️ Em Batch (JCL)

Utilizando IKJEFT01:

```
//STEP1 EXEC PGM=IKJEFT01
//SYSEXEC DD DISP=SHR,DSN=SEU.DATASET.REXX
//SYSTSPRT DD SYSOUT=*
//SYSTSIN DD *
  %SCRIPT
/*
```

------

### ▶️ Em USS (UNIX System Services)

Se suportado:

```
rexx script.rexx
```

------

## 🧪 Metodologia

Este workbook prioriza:

✔ Aprendizado prático
 ✔ Exemplos reais de produção
 ✔ Automação operacional
 ✔ Progressão gradual de complexidade
 ✔ Casos aplicáveis ao dia a dia

------

## 🏆 Competências Desenvolvidas

Ao concluir o material, o aluno será capaz de:

- Criar scripts REXX robustos
- Automatizar tarefas no z/OS
- Interagir com TSO, ISPF e USS
- Integrar REXX com subsistemas do Mainframe
- Monitorar e analisar recursos do sistema
- Desenvolver ferramentas operacionais

------

## 💡 Sobre REXX

REXX é uma linguagem poderosa e amplamente utilizada no ecossistema IBM Z para automação, administração e integração de sistemas.

Principais características:

- Sintaxe simples e legível
- Forte integração com z/OS
- Execução interativa ou batch
- Ideal para scripts operacionais

------

## 📚 Uso Educacional

Este material pode ser utilizado para:

- Treinamentos corporativos
- Cursos técnicos
- Workshops
- Autoestudo
- Capacitação profissional

------

## 📜 Licença

Uso livre desde que deixe uma estrela no repositório e faça referencia ao autor.



------

## 👨‍🏫 Autor

**Vagner Bellacosa**
 Especialista em IBM Mainframe
 Instrutor e evangelizador da Stack Mainframe