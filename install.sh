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
echo "═══════════════════════════════════════════════════════════"
echo "✅ Instalação completa!"
echo ""
echo "🎯 Comandos disponíveis:"
echo ""
echo "   claude-sessions          # Listar sessões"
echo "   claude-view <id>         # Ver sessão completa"
echo "   claude-search <palavra>  # Buscar nas sessões"
echo "   claude-history <texto>   # Comando unificado (linguagem natural)"
echo ""
echo "💡 Teste agora:"
echo "   claude-sessions"
echo "   claude-history 'última sessão'"
echo "   claude-history 'buscar git'"
echo ""
