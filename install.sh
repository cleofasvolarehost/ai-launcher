#!/usr/bin/env bash
# Instalador do AI CLI Launcher
# Uso: curl -fsSL https://raw.githubusercontent.com/cleofasvolarehost/ai-launcher/main/install.sh | bash

set -euo pipefail

BOLD='\033[1m'
GREEN='\033[32m'
YELLOW='\033[33m'
CYAN='\033[36m'
RESET='\033[0m'

INSTALL_DIR="${HOME}/.local/bin"
REPO_URL="https://raw.githubusercontent.com/cleofasvolarehost/ai-launcher/main/ai"

echo -e "${BOLD}${CYAN}"
echo "  ┌──────────────────────────────────────┐"
echo "  │   AI CLI Launcher - Instalador       │"
echo "  └──────────────────────────────────────┘"
echo -e "${RESET}"

# Criar diretório se não existir
mkdir -p "$INSTALL_DIR"

# Baixar o script
echo -e "${GREEN}Baixando ai-launcher...${RESET}"
if command -v curl &>/dev/null; then
    curl -fsSL "$REPO_URL" -o "${INSTALL_DIR}/ai"
elif command -v wget &>/dev/null; then
    wget -qO "${INSTALL_DIR}/ai" "$REPO_URL"
else
    echo "Erro: curl ou wget necessário."
    exit 1
fi

chmod +x "${INSTALL_DIR}/ai"

# Verificar se ~/.local/bin está no PATH
if ! echo "$PATH" | tr ':' '\n' | grep -q "${HOME}/.local/bin"; then
    echo ""
    echo -e "${YELLOW}Adicione ao seu shell (~/.bashrc ou ~/.zshrc):${RESET}"
    echo ""
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""

    # Tentar adicionar automaticamente
    SHELL_RC=""
    if [[ -f "${HOME}/.zshrc" ]]; then
        SHELL_RC="${HOME}/.zshrc"
    elif [[ -f "${HOME}/.bashrc" ]]; then
        SHELL_RC="${HOME}/.bashrc"
    fi

    if [[ -n "$SHELL_RC" ]]; then
        read -rp "Adicionar ao ${SHELL_RC} automaticamente? [s/N]: " yn
        if [[ "$yn" == [sS] ]]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
            echo -e "${GREEN}Adicionado! Rode: source ${SHELL_RC}${RESET}"
        fi
    fi
fi

echo ""
echo -e "${GREEN}Instalado com sucesso!${RESET}"
echo ""
echo "Uso:"
echo "  ai          Menu interativo"
echo "  ai c        Claude Code"
echo "  ai x        Codex"
echo "  ai g        Gemini"
echo "  ai --help   Ajuda completa"
echo ""
echo -e "${YELLOW}Pré-requisitos (instale os que quiser usar):${RESET}"
echo "  npm install -g @anthropic-ai/claude-code   # Claude"
echo "  npm install -g @openai/codex               # Codex"
echo "  npm install -g @google/gemini-cli           # Gemini"
