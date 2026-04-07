# AI CLI Launcher

Lançador interativo para CLIs de IA com flags pré-configuradas. Nunca mais esqueça aquele comando gigante.

## Instalação

```bash
curl -fsSL https://raw.githubusercontent.com/cleofasvolarehost/ai-launcher/main/install.sh | bash
```

Ou manualmente:

```bash
curl -fsSL https://raw.githubusercontent.com/cleofasvolarehost/ai-launcher/main/ai -o ~/.local/bin/ai
chmod +x ~/.local/bin/ai
```

## Uso

```bash
ai              # Menu interativo com status de cada CLI
ai c            # Claude Code direto
ai x            # Codex direto
ai g            # Gemini direto
ai c "prompt"   # Claude com prompt
ai --history    # Ver histórico de uso
ai --config     # Editar flags
ai --help       # Ajuda
```

## CLIs suportadas

| CLI | Atalho | Flag padrão |
|-----|--------|-------------|
| Claude Code | `ai c` | `--dangerously-skip-permissions` |
| Codex | `ai x` | `--full-auto --dangerously-bypass-approvals-and-sandbox` |
| Gemini | `ai g` | `--yolo` |

## Features

- Menu interativo com versão e status de instalação
- Verifica se API keys estão configuradas antes de lançar
- Histórico de uso
- Passagem de prompt direto via linha de comando
- Flags configuráveis no topo do script
- Funciona em Linux e macOS

## Pré-requisitos

Instale as CLIs que quiser usar:

```bash
npm install -g @anthropic-ai/claude-code   # Claude
npm install -g @openai/codex               # Codex
npm install -g @google/gemini-cli           # Gemini
```

## Personalização

Rode `ai --config` ou edite `~/.local/bin/ai` — as flags ficam no topo do arquivo.

## Licença

MIT
