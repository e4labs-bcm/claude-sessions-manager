#!/bin/bash

# Claude Sessions Manager - Instalador
# Instala os comandos globalmente no sistema

set -e  # Exit on error

echo "🚀 Claude Sessions Manager - Instalador"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Detectar diretório de instalação
if [ -d "$HOME/.local/bin" ]; then
    INSTALL_DIR="$HOME/.local/bin"
elif [ -d "$HOME/bin" ]; then
    INSTALL_DIR="$HOME/bin"
else
    # Criar ~/.local/bin se não existir
    mkdir -p "$HOME/.local/bin"
    INSTALL_DIR="$HOME/.local/bin"
fi

echo "📂 Diretório de instalação: $INSTALL_DIR"
echo ""

# Copiar scripts
echo "📦 Instalando comandos..."
cp claude-sessions "$INSTALL_DIR/claude-sessions"
cp claude-view "$INSTALL_DIR/claude-view"
cp claude-search "$INSTALL_DIR/claude-search"
cp claude-history "$INSTALL_DIR/claude-history"

# Tornar executável
chmod +x "$INSTALL_DIR/claude-sessions"
chmod +x "$INSTALL_DIR/claude-view"
chmod +x "$INSTALL_DIR/claude-search"
chmod +x "$INSTALL_DIR/claude-history"

echo "✅ Comandos instalados:"
echo "   - claude-sessions"
echo "   - claude-view"
echo "   - claude-search"
echo "   - claude-history (NOVO! 🎉)"
echo ""

# Verificar se $INSTALL_DIR está no PATH
if [[ ":$PATH:" == *":$INSTALL_DIR:"* ]]; then
    echo "✅ $INSTALL_DIR já está no PATH"
else
    echo "⚠️  $INSTALL_DIR NÃO está no PATH"
    echo ""
    echo "📝 Adicione ao seu ~/.bashrc ou ~/.zshrc:"
    echo ""
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
    echo "Depois execute:"
    echo "   source ~/.bashrc  # ou source ~/.zshrc"
fi

echo ""

# Instalar slash command global
echo "📦 Instalando slash command /sessions..."
mkdir -p "$HOME/.claude/commands"
if [ -f "sessions.md" ]; then
    cp sessions.md "$HOME/.claude/commands/sessions.md"
    echo "✅ Slash command /sessions instalado"
    echo "   (use /sessions no Claude Code após recarregar a janela)"
else
    echo "⚠️  Arquivo sessions.md não encontrado (opcional)"
fi
echo ""

echo "═══════════════════════════════════════════════════════════"
echo "✅ Instalação completa!"
echo ""
echo "🎯 Comandos disponíveis:"
echo ""
echo "   claude-sessions          # Listar sessões"
echo "   claude-view <id>         # Ver sessão completa"
echo "   claude-search <palavra>  # Buscar nas sessões"
echo "   claude-history <texto>   # Comando unificado (linguagem natural)"
echo "   /sessions                # Slash command (no Claude Code)"
echo ""
echo "💡 Teste agora:"
echo "   claude-sessions"
echo "   claude-history 'última sessão'"
echo "   claude-history 'buscar git'"
echo ""

# Oferecer instalação no CLAUDE.md do projeto
echo "═══════════════════════════════════════════════════════════"
echo "🎯 INTEGRAÇÃO COM PROJETO (OPCIONAL)"
echo ""
echo "Deseja adicionar instruções ao CLAUDE.md do seu projeto?"
echo "Isso fará com que o Claude Code saiba automaticamente usar estes comandos."
echo ""
read -p "Adicionar ao CLAUDE.md? (s/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ss]$ ]]; then
    read -p "📂 Digite o caminho do diretório do projeto: " PROJECT_DIR

    if [ -d "$PROJECT_DIR" ]; then
        CLAUDE_MD="$PROJECT_DIR/CLAUDE.md"

        # Verificar se já existe
        if [ -f "$CLAUDE_MD" ] && grep -q "claude-sessions" "$CLAUDE_MD" 2>/dev/null; then
            echo "✅ CLAUDE.md já contém instruções do claude-sessions-manager"
        else
            # Adicionar ao final do arquivo
            cat >> "$CLAUDE_MD" << 'EOF'

---

## 📚 **SISTEMA DE SESSÕES - IMPORTANTE!**

**Para Claude Code**: Se você precisa recuperar contexto de sessões anteriores, **USE SEMPRE** estes comandos via Bash tool:

### Comandos Disponíveis:

1. **Listar sessões anteriores:**
   ```bash
   ~/.local/bin/claude-sessions
   ```

2. **Ver conversa completa de uma sessão:**
   ```bash
   ~/.local/bin/claude-view <sessionId>
   ```

3. **Buscar por palavra-chave:**
   ```bash
   ~/.local/bin/claude-search "palavra-chave"
   ```

4. **Comando unificado (linguagem natural):**
   ```bash
   ~/.local/bin/claude-history "última sessão"
   ~/.local/bin/claude-history "buscar git"
   ~/.local/bin/claude-history "listar"
   ```

### Quando Usar:

- ✅ **Sempre** que o usuário pedir para "buscar", "ver", "mostrar" sessões anteriores
- ✅ Quando perguntar "o que estávamos fazendo?"
- ✅ Para recuperar contexto após crashes ou reinicializações

### ⚠️ IMPORTANTE - O Que NÃO Fazer:

**CORRETO ✅:**
```
Usuário: "Busque nossa última sessão"
Claude: [Executa] Bash(~/.local/bin/claude-sessions)
```

**INCORRETO ❌:**
```
Claude: [Procura em] git log, arquivos .md, outros lugares
```

**NUNCA busque em:**
- ❌ git log ou git history
- ❌ Arquivos .md do projeto
- ❌ Checkpoints ou outros sistemas
- ❌ Arquivos de documentação

**Sistema**: Claude Code salva TODAS as conversas automaticamente em `~/.claude/history.jsonl`

**Repositório**: https://github.com/e4labs-bcm/claude-sessions-manager
EOF
            echo "✅ Instruções adicionadas ao $CLAUDE_MD"
        fi
    else
        echo "❌ Diretório não encontrado: $PROJECT_DIR"
    fi
else
    echo "⏭️  Pulando integração com CLAUDE.md"
    echo ""
    echo "💡 Você pode adicionar manualmente depois copiando de:"
    echo "   CLAUDE_MD_TEMPLATE.md"
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "🎉 Tudo pronto! Use 'claude-sessions' para começar."
echo ""
