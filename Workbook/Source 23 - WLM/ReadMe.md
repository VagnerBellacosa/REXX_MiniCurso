# 📊 z/OS WLM REXX Toolkit

## Automação e Monitoramento de Workload Manager com REXX

Coleção de scripts REXX desenvolvidos para monitoramento, análise e automação operacional do **Workload Manager (WLM)** no ambiente IBM z/OS.

Este toolkit fornece utilitários práticos para acompanhamento de desempenho, investigação de problemas, capacity planning e suporte a operações de produção.

------

## 🎯 Objetivos

- Automatizar tarefas relacionadas ao WLM
- Monitorar workload e desempenho em tempo real
- Auxiliar na análise de políticas e classes de serviço
- Identificar gargalos de CPU, memória e I/O
- Apoiar troubleshooting operacional
- Facilitar capacity planning e tuning

------

## 👥 Público-Alvo

- Operadores de Mainframe
- Analistas de Performance
- Sysprogs z/OS
- Especialistas WLM
- Equipes de produção e suporte
- Profissionais de Capacity Planning

------

## 🧠 Pré-requisitos

Recomendado:

- Conhecimento básico de z/OS
- Familiaridade com WLM e suas políticas
- Acesso a TSO/ISPF
- Autorizações adequadas para consultas SMF/RMF
- Dataset SYSEXEC ou SYSPROC configurado

------

## ⚙️ Funcionalidades do Toolkit

Os scripts podem incluir funcionalidades como:

✔ Consulta de classes de serviço
 ✔ Monitoramento de metas e objetivos WLM
 ✔ Verificação de consumo de CPU por workload
 ✔ Identificação de atraso (delay) e contention
 ✔ Análise de importância (importance levels)
 ✔ Acompanhamento de enclaves e address spaces
 ✔ Integração com dados SMF/RMF
 ✔ Relatórios operacionais sob demanda
 ✔ Scripts de troubleshooting

------

## 📂 Estrutura da Pasta

Os scripts estão organizados para facilitar uso operacional e manutenção.

```
Workbook/Source 23 - WLM
│
├── *.rexx / *.exec     → Scripts REXX principais
├── JCL/                → Exemplos de execução em batch
├── DOC/                → Documentação adicional (opcional)
└── README.md           → Este arquivo
```

*(A estrutura pode variar conforme o ambiente.)*

------

## 🚀 Como Executar os Scripts

### ▶️ Execução Interativa (TSO/ISPF)

Se os scripts estiverem em um dataset alocado em SYSEXEC ou SYSPROC:

```
TSO NOME_SCRIPT
```

ou

```
EXEC 'USER.REXX.DATASET(NOME)'
```

------

### ▶️ Execução em Batch (JCL)

Utilizando IKJEFT01:

```
//WLMJOB  JOB CLASS=A,MSGCLASS=X
//STEP1   EXEC PGM=IKJEFT01
//SYSEXEC DD DISP=SHR,DSN=USER.REXX.LIB
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  %SCRIPT
/*
```

------

## 📊 Casos de Uso

Este toolkit pode ser utilizado para:

- Monitoramento contínuo de workloads críticos
- Investigação de degradação de performance
- Análise pós-incidente
- Ajuste de políticas WLM
- Planejamento de capacidade (R4HA)
- Auditorias operacionais
- Suporte a plantão (on-call)

------

## 🧩 Integração com z/OS

Os scripts podem interagir com:

- WLM APIs
- TSO/E comandos
- RMF Monitor
- SMF records
- SDSF
- RACF (quando necessário)
- Subsystems do z/OS

------

## ⚠️ Considerações Operacionais

- Alguns scripts podem exigir permissões especiais
- Recomenda-se execução em ambiente de testes antes da produção
- Verifique políticas de segurança locais
- Saídas podem variar conforme versão do z/OS e WLM

------

## 🏆 Benefícios

✔ Redução do tempo de diagnóstico
 ✔ Aumento da visibilidade operacional
 ✔ Automação de tarefas repetitivas
 ✔ Apoio a decisões de tuning
 ✔ Maior confiabilidade do ambiente

------

## 📚 Sobre o Workload Manager (WLM)

O WLM é o componente do z/OS responsável por:

- Gerenciar prioridades de processamento
- Garantir cumprimento de objetivos de desempenho
- Balancear recursos entre workloads
- Otimizar utilização do sistema

Ele é essencial para ambientes corporativos de missão crítica.

------

## 🧪 Uso Educacional

Além do uso em produção, os scripts podem servir para:

- Treinamento de operadores
- Laboratórios de performance
- Estudos sobre arquitetura z/OS
- Capacitação em administração WLM

------

## 📜 Licença

Uso livre desde que deixe uma estrela no repositório e cite o autor.

------

## 👨‍💻 Autor

**Vagner Bellacosa**
 Especialista em IBM Mainframe
 Instrutor e evangelizador da Stack Mainframe