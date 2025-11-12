#!/bin/bash

# Claude Sessions Manager - Desinstalador

echo "🗑️  Claude Sessions Manager - Desinstalador"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Detectar diretório de instalação
INSTALL_DIRS=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "/usr/local/bin"
)

REMOVED=0

for DIR in "${INSTALL_DIRS[@]}"; do
    if [ -f "$DIR/claude-sessions" ]; then
        echo "🔍 Encontrado em: $DIR"
        rm -f "$DIR/claude-sessions" "$DIR/claude-view" "$DIR/claude-search"
        echo "✅ Removido de: $DIR"
        REMOVED=1
    fi
done

echo ""
if [ $REMOVED -eq 1 ]; then
    echo "✅ Desinstalação completa!"
    echo ""
    echo "💡 Os comandos foram removidos, mas seu histórico em ~/.claude/history.jsonl"
    echo "   foi preservado e continuará funcionando com o Claude Code."
else
    echo "⚠️  Nenhuma instalação encontrada."
    echo "💡 Os comandos podem não estar instalados ou estão em outro diretório."
fi

echo ""
