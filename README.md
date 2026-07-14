# Projeto MegaBrain 🧠

O **Projeto MegaBrain** é um ecossistema de produtividade e gestão de conhecimento automatizado (Intelligent Second Brain). Este projeto combina o poder organizacional do **Obsidian** com a inteligência ativa do **OpenCode CLI** (agente de IA focado em desenvolvimento) e do **Gemini Scribe** (busca semântica RAG). 

Este repositório foi estruturado para ser totalmente seguro e portátil: inclui um **laboratório de testes isolado em Docker** (caixa de areia) para prototipagem visual sem sujar o teu sistema operacional e um instalador automatizado (`setup.sh`) para fazer o deploy nativo na tua máquina física ou na dos teus amigos.

---

## 📂 Estrutura do Repositório

```text
Projeto-Megabrain/
├── second-brain-vault/       # O teu cofre personalizado do Obsidian (notas, temas e plugins)
│   ├── .obsidian/            # Configurações globais e plugins comunitários pré-instalados
│   │   ├── community-plugins.json  # Lista de plugins ativos (OpenCode, Gemini Scribe)
│   │   └── plugins/          # Código-fonte dos plugins locais
│   └── 00 - Comece Aqui.md   # Nota explicativa de boas-vindas do teu template
├── Dockerfile.dev            # Constrói o container Linux de testes com GUI e OpenCode CLI
├── docker-compose.yml        # Orquestra as portas e mapeia os volumes do laboratório
├── .gitignore                # Impede o upload de chaves de API, segredos e ficheiros temporários
└── setup.sh                  # O instalador mágico para configurar o ecossistema nativamente no Host

```

---

## 🛠️ Requisitos Prévios

Antes de iniciares, garante que tens instalado na tua máquina física:

* [Docker](https://docs.docker.com/get-docker/) e [Docker Compose](https://docs.docker.com/compose/install/)
* [Git](https://git-scm.com/)

---

## 🐳 1. O Laboratório de Testes (Ambiente Docker)

O ambiente Docker serve exclusivamente para **desenvolvimento e homologação**. Podes instalar plugins, testar novos temas e quebrar o Obsidian à vontade no navegador sem afetar o teu computador físico.

### Como Iniciar o Laboratório:

1. Sobe o container em segundo plano:
```bash
docker compose up -d --build

```


2. Abre o teu navegador de internet e acesse:
```text
http://localhost:3000

```


3. Na interface gráfica do Linux virtual, o Obsidian abrirá automaticamente:
* Clica em **"Open folder as vault"**.
* Navega até a **raiz do sistema** (`/`) e seleciona a pasta `/vault` (que é o espelho da tua pasta física `second-brain-vault`).



> 💡 **Nota sobre Persistência:** Tudo o que customizares dentro do navegador (instalar plugins, mudar cores, escrever notas) será gravado **instantaneamente** na pasta `second-brain-vault/` do teu computador real devido ao mapeamento de volumes.

---

## 💻 2. Instalação Nativa no Sistema Operacional (Script Setup)

Quando o teu template estiver pronto e quiseres utilizá-lo nativamente fora do Docker — ou quando partilhares este repositório com os teus amigos —, basta executar o script instalador na máquina real (Host).

### Como Instalar Nativamente:

Abra o terminal da tua máquina host (fora do Docker) na raiz do projeto e executa:

```bash
# Dá permissão de execução (se necessário)
chmod +x setup.sh

# Executa o instalador
./setup.sh

```

**O que o script faz automaticamente:**

1. Detecta o teu SO (Linux ou macOS).
2. Instala o **Obsidian oficial** de forma nativa através do gerenciador de pacotes ideal (`apt`, `snap`, `flatpak` ou `homebrew`).
3. Instala o **OpenCode CLI** globalmente no teu computador.
4. Clona os pacotes de contexto e habilidades de IA do Obsidian (`obsidian-skills`).

---

## 🔄 Fluxo de Trabalho do Git (Versionamento)

**⚠️ IMPORTANTE: Nunca faças commits de dentro do container Docker.**

Como os teus ficheiros de notas e configurações estão espelhados diretamente no teu HD físico através dos volumes do Docker, deves gerir o teu repositório GitHub através do **terminal do teu computador real (Host)** ou pelo VSCode local. Isso garante o uso correto das tuas chaves SSH e credenciais pessoais do GitHub.

### Como Salvar Etapas do Projeto:

```bash
# Executa na máquina física (raiz do projeto)
git status
git add .
git commit -m "feat: adiciona plugins de IA e novas notas estruturais"
git push origin main

```

### O que o `.gitignore` protege:

O ficheiro `.gitignore` incluído neste projeto já está configurado para salvar os teus plugins e temas customizados, mas **bloqueia** automaticamente logs privados, chaves de API, tokens do OpenCode (`.opencode/secrets`) e o ficheiro temporário `workspace.json` (que guarda o layout de abas abertas, evitando que a tua disposição de janelas interfira na tela dos teus amigos).

---

## 🤖 Como Interagir com a IA após a Instalação Nativa

1. Abre o **Obsidian** recém-instalado no teu computador físico.
2. Abre a pasta `second-brain-vault` como o teu cofre (*vault*).
3. Abre o terminal do teu computador real dentro da pasta `second-brain-vault` e digite:
```bash
opencode

```


4. O teu agente de IA local será inicializado e terá contexto completo sobre todas as tuas notas Markdown, tabelas e tarefas em tempo real!
