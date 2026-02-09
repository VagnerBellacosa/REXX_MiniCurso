# Windows REXX



## 🛠️ 1️⃣ **ooRexx (Open Object Rexx)** — recomendado

👉 **O mais moderno e compatível com REXX clássico**
 👉 Pode rodar programas REXX escritos normalmente
 👉 Possui instalador para Windows

📥 **Download oficial:**
 ➡️ [https://www.oorexx.org/downloads.rsp](https://www.oorexx.org/downloads.rsp?utm_source=chatgpt.com)  — Página oficial de downloads do ooRexx, onde você encontra versões estáveis (ex.: 5.0.0) para **Windows 32‑bit ou 64‑bit**. 

**Como instalar no Windows:**

1. Baixe o arquivo `ooRexx‑5.0.0.windows.x86_64.exe` (ou a versão certa para seu sistema). 
2. Clique duas vezes no instalador.
3. Siga o assistente (como qualquer programa Windows).
4. Após instalar, você terá o interpretador `ooRexx.exe` no seu **Program Files**.

💡 **Rodar script** no Prompt:

```
ooRexx.exe meu_script.rex
```

------

## 🛠️ 2️⃣ **Regina REXX** — clássico e simples

👉 **Interprete REXX tradicional** (ANSI REXX)
 👉 Boa opção se você quer apenas testar REXX simples
 👉 Disponível via SourceForge

📥 **Download:**
 ➡️ https://sourceforge.net/projects/regina-rexx/ — Página com versões antigas e atuais do Regina. 

Na lista de arquivos geralmente tem:

- `Regina394w64.exe` → instalador Windows 64‑bit
- `Regina394w32.exe` → instalador Windows 32‑bit
   *Obs:* Se a página exibir downloads de outras plataformas, filtre por **Windows**.

**Instalação no Windows:**

1. Baixe a versão `.exe` apropriada.
2. Clique duas vezes e instale normalmente.
3. Após instalado, você terá o comando `regina` disponível.

💡 **Rodar script** no Prompt:

```
regina meu_script.rexx
```

------

## 📌 Dicas importantes para instalar no Windows

✅ Após instalar ooRexx ou Regina, adicione a pasta do interpretador ao **PATH do Windows** (Painel de Controle → Sistema → Variáveis de Ambiente).
 👉 Assim você pode digitar `ooRexx` ou `regina` diretamente no prompt sem informar o caminho completo.

✅ Scripts REXX geralmente terminam em `.rexx`, `.rex` ou `.rxs`.

------

## 📌 Boas práticas

- **ooRexx** é mais completo e atualizado → compatível com muitos recursos modernos e extensões. 
- **Regina** é ótimo para REXX clássico simples e portable. 

------

## 🧪 Exemplo de script para testar

Crie um arquivo `ola.rex` com:

```
/* REXX */
say "Olá do REXX no Windows!"
exit
```

Execute com:

```
ooRexx ola.rex
```

ou

```
regina ola.rex
```