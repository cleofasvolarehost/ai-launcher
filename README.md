# AI CLI Launcher

Lançador interativo para CLIs de IA com flags pré-configuradas. Nunca mais esqueça aquele comando gigante.

## Instalação

```bash
curl -fsSL https://raw.githubusercontent.com/cleofasvolarehost/ai-launcher/main/install.sh | bash
```

Compatível com o Bash padrão do macOS (`3.2`) e com Linux moderno. Não precisa instalar Bash via Homebrew.

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

### Worktree Manager

Gerencia worktrees git direto do launcher, com nomes aleatórios em português.

```bash
ai w            # Menu interativo de worktrees
ai w new        # Cria worktree (nome aleatório BR: capivara-esperta, tucano-veloz...)
ai w new meu-fix  # Cria com nome específico
ai w ls         # Lista worktrees ativos com status
ai w del        # Remove worktree (interativo)
ai w del nome   # Remove worktree direto
ai w clean      # Limpa worktrees de branches deletadas no remote
ai w open       # Cria worktree + abre Claude Code nele
```

Worktrees ficam organizados em `~/.worktrees/<repo>/<nome>`.

## CLIs suportadas

| CLI | Atalho | Flag padrão |
|-----|--------|-------------|
| Claude Code | `ai c` | `--dangerously-skip-permissions` |
| Codex | `ai x` | `--dangerously-bypass-approvals-and-sandbox` |
| Gemini | `ai g` | `--yolo` |

## Features

- Menu interativo com versão e status de instalação
- Não exige `*_API_KEY`; o launcher delega autenticação para cada CLI
- Histórico de uso
- Passagem de prompt direto via linha de comando
- Flags configuráveis no topo do script
- Worktree manager com nomes aleatórios BR (animal-adjetivo)
- Listagem de worktrees com status dirty/clean
- Limpeza automática de worktrees órfãos
- Funciona em Linux e no macOS padrão

## Pré-requisitos

Instale as CLIs que quiser usar:

```bash
npm install -g @anthropic-ai/claude-code   # Claude
npm install -g @openai/codex               # Codex
npm install -g @google/gemini-cli           # Gemini
```

Depois, autentique cada ferramenta usando o fluxo nativo dela (`claude`, `codex` e `gemini`). O launcher não valida nem exige variáveis como `ANTHROPIC_API_KEY`, `OPENAI_API_KEY` ou `GEMINI_API_KEY`.

## Personalização

Rode `ai --config` ou edite `~/.local/bin/ai` — as flags ficam no topo do arquivo.

## Licença

MIT
