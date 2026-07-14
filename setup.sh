#!/usr/bin/env bash

# Cores para formatar o terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=== Iniciando Instalação do Setup Second Brain no Host ===${NC}"

# Detecta o Sistema Operacional (Linux ou macOS)
OS="$(uname -s)"

# 1. Instalação do Obsidian no Host
if ! [ -x "$(command -v obsidian)" ] && [ "$OS" = "Linux" ]; then
  echo -e "${YELLOW}Obsidian não encontrado no sistema. Identificando gerenciador de pacotes...${NC}"
  
  if [ -x "$(command -v flatpak)" ]; then
    echo -e "${GREEN}Instalando Obsidian via Flatpak...${NC}"
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    sudo flatpak install -y flathub md.obsidian.Obsidian
  elif [ -x "$(command -v snap)" ]; then
    echo -e "${GREEN}Instalando Obsidian via Snap...${NC}"
    sudo snap install obsidian --classic
  elif [ -x "$(command -v apt-get)" ]; then
    echo -e "${GREEN}Instalando dependências e baixando Obsidian .deb oficial...${NC}"
    sudo apt-get update && sudo apt-get install -y wget
    wget -O /tmp/obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_amd64.deb"
    sudo dpkg -i /tmp/obsidian.deb || sudo apt-get install -f -y
  else
    echo -e "${RED}Não foi possível instalar o Obsidian automaticamente. Instale-o manualmente no seu Linux.${NC}"
  fi
elif [ "$OS" = "Darwin" ]; then # macOS
  if [ -x "$(command -v brew)" ]; then
    echo -e "${GREEN}Instalando Obsidian via Homebrew Cask...${NC}"
    brew install --cask obsidian
  else
    echo -e "${YELLOW}Homebrew não encontrado. Por favor, instale o Obsidian via Mac App Store.${NC}"
  fi
else
  echo -e "${GREEN}Obsidian já está instalado no Host.${NC}"
fi

# 2. Instalação do OpenCode CLI
if ! [ -x "$(command -v opencode)" ]; then
  echo -e "${YELLOW}OpenCode CLI não encontrado. Instalando nativamente...${NC}"
  curl -FsSL https://opencode.ai/install | bash
else
  echo -e "${GREEN}OpenCode CLI já está instalado no Host.${NC}"
fi

# 3. Preparação das Obsidian Skills (Habilidades da IA no cofre)
SKILLS_DIR="second-brain-vault/.opencode/skills/obsidian-skills"
if [ ! -d "$SKILLS_DIR" ]; then
  echo -e "${YELLOW}Baixando pacotes de habilidades (Obsidian Skills do Kepano)...${NC}"
  git clone https://github.com/kepano/obsidian-skills.git "$SKILLS_DIR"
else
  echo -e "${GREEN}As Obsidian Skills já estão preparadas no cofre.${NC}"
fi

echo -e "\n${GREEN}=== Instalação e Configuração Concluídas! ===${NC}"
echo -e "Para usar:"
echo -e "1. Abra o ${BLUE}Obsidian${NC} no seu computador."
echo -e "2. Selecione 'Open folder as vault' e escolha a pasta: ${YELLOW}$(pwd)/second-brain-vault${NC}"
echo -e "3. No seu terminal, acesse a pasta do cofre e execute ${YELLOW}opencode${NC} para interagir com a IA!"