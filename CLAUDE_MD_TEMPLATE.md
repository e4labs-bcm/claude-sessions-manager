# Template para CLAUDE.md

Copie e cole este conteúdo no arquivo `CLAUDE.md` do seu projeto para que o Claude Code saiba automaticamente usar os comandos do claude-sessions-manager.

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
