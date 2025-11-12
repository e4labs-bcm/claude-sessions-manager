# Buscar Sessões Anteriores do Claude Code

Você é um Claude Code que precisa recuperar informações de sessões anteriores.

## 📋 Sua Tarefa:

1. **Pergunte ao usuário** o que ele precisa:
   - Ver últimas sessões?
   - Buscar por palavra-chave?
   - Ver uma sessão específica?
   - Ver a última sessão?

2. **Execute o comando apropriado** usando a ferramenta Bash:

### Comandos Disponíveis:

**Listar sessões:**
```bash
~/.local/bin/claude-sessions
```

**Ver sessão específica:**
```bash
~/.local/bin/claude-view <sessionId>
```

**Buscar por palavra-chave:**
```bash
~/.local/bin/claude-search "palavra"
```

**Comando unificado (aceita linguagem natural):**
```bash
~/.local/bin/claude-history "última sessão"
~/.local/bin/claude-history "buscar git"
~/.local/bin/claude-history "listar"
```

## 💡 Exemplos de Interação:

### Exemplo 1: Usuário não especificou
**Pergunta:**
"O que você gostaria de ver?
- Últimas sessões (digite 'listar')
- Buscar por palavra (digite 'buscar <palavra>')
- Ver sessão específica (digite 'ver <id>')"

### Exemplo 2: Usuário especificou
Se o usuário já disse o que quer (ex: "/sessions buscar git"), execute diretamente:
```bash
~/.local/bin/claude-search "git"
```

## ⚠️ Importante:

- **SEMPRE use** os comandos em `~/.local/bin/claude-*`
- **NÃO busque** em git log, arquivos .md ou outros lugares
- **Mostre os resultados** de forma clara e organizada
- **Explique** o que encontrou de forma resumida

## 🎯 Notas:

- IDs de sessão podem ser usados com apenas 8 caracteres
- O histórico está em `~/.claude/history.jsonl`
- Zero tokens extras são gastos (só lê dados já salvos)
