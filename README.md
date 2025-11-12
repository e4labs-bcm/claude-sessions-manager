# 📚 Claude Sessions Manager

**Nunca mais perca o contexto das suas conversas com Claude Code!**

Um conjunto de ferramentas simples para visualizar, buscar e recuperar o histórico completo de conversas do Claude CLI - sem gastar tokens extras.

---

## 🎯 Problema Resolvido

Quando o Claude Code reinicia (CLI ou IDE), você perde todo o contexto da conversa. Mas o Claude **já salva automaticamente** todas as conversas em `~/.claude/history.jsonl`.

Este pacote fornece ferramentas para **acessar facilmente** esse histórico.

---

## ✨ Funcionalidades

- ✅ **Zero configuração** - Funciona imediatamente
- ✅ **Zero tokens extras** - Apenas lê o que já foi salvo
- ✅ **IDs curtos** - Use apenas os primeiros 8 caracteres
- ✅ **Busca inteligente** - Encontre conversas por palavra-chave
- ✅ **Linguagem natural** 🆕 - `claude-history "última sessão"` (português/inglês)
- ✅ **Slash command** 🆕 - Use `/sessions` no Claude Code
- ✅ **Integração CLAUDE.md** 🆕 - Claude sabe automaticamente usar os comandos
- ✅ **Portátil** - Funciona em macOS e Linux
- ✅ **Leve** - Scripts Python puros (sem dependências externas)

---

## 🚀 Instalação Rápida

### 1. Clone ou baixe este repositório
```bash
git clone https://github.com/e4labs-bcm/claude-sessions-manager.git
cd claude-sessions-manager
```

### 2. Execute o instalador
```bash
bash install.sh
```

### 3. (Opcional) Adicione ao PATH se necessário
Se o instalador avisar, adicione ao `~/.bashrc` ou `~/.zshrc`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

Depois:
```bash
source ~/.bashrc  # ou source ~/.zshrc
```

---

## 📖 Uso

### 1️⃣ Listar Sessões
Mostra as últimas 20 sessões salvas:
```bash
claude-sessions
```

**Resultado:**
```
📚 Histórico de Sessões do Claude CLI
════════════════════════════════════════════════════════════

📄 Sessão: 065fa436... (12/11/2025 08:40)
   Projeto: hub-app-nextjs
   Preview: '/Users/user/Desktop/screenshot.png'...

📄 Sessão: 46f5b309... (10/11/2025 07:57)
   Projeto: hub-app-nextjs
   Preview: estou com um problema, meu claude code reinicia...
...
```

---

### 2️⃣ Ver Sessão Completa
Mostra todas as mensagens de uma conversa (aceita ID curto!):
```bash
claude-view 065fa436
```

**Resultado:**
```
📖 Sessão: 065fa436-095b-4fad-8d2d-75cee27a3de4
════════════════════════════════════════════════════════════

[08:40:15] Preciso implementar autenticação JWT...

[08:42:30] Vou criar o arquivo src/lib/jwt.ts...

[08:45:12] Pronto! A autenticação está funcionando.
...
```

**Para copiar para arquivo:**
```bash
claude-view 065fa436 > /tmp/sessao.txt
```

---

### 3️⃣ Buscar por Palavra-Chave
Encontra todas as sessões que mencionaram um termo:
```bash
claude-search "autenticação"
claude-search "API routes"
claude-search "bug"
```

**Resultado:**
```
🔍 Buscando por: "autenticação"
════════════════════════════════════════════════════════════

📄 065fa436... (12/11/2025 08:40) - hub-app-nextjs
   Preciso implementar autenticação JWT para as API routes...

📄 7ecf3002... (04/11/2025 22:54) - hub-app-nextjs
   Como funciona a autenticação com Auth.js no Next.js 16?...

✅ 15 resultados encontrados em 2 sessões
```

---

### 4️⃣ Comando Unificado (Linguagem Natural) 🆕
Use **linguagem natural** sem precisar lembrar dos comandos específicos:
```bash
claude-history "última sessão"
claude-history "buscar git"
claude-history "listar"
claude-history "ver 065fa436"
claude-history "procurar autenticação"
```

**Aceita português e inglês:**
- "última sessão", "last session", "recente"
- "buscar git", "search git", "encontrar git"
- "listar", "list", "sessões", "show sessions"
- "ver 065fa436", "view 065fa436", "mostrar 065fa436"

---

### 5️⃣ Slash Command no Claude Code 🆕
Depois da instalação, recarregue o Claude Code (Cmd+Shift+P → "Reload Window") e use:
```
/sessions
```

O Claude Code vai perguntar o que você precisa e executar o comando apropriado automaticamente.

---

### 6️⃣ Integração Automática com Projetos 🆕
Durante a instalação, você pode adicionar instruções ao `CLAUDE.md` do seu projeto. Isso faz com que o Claude Code **automaticamente saiba** usar estes comandos quando você pedir para "buscar sessões anteriores".

**Ou adicione manualmente:**
Copie o conteúdo de `CLAUDE_MD_TEMPLATE.md` para o `CLAUDE.md` do seu projeto.

---

## 🎯 Casos de Uso

### ✅ "Claude reiniciou e perdi o contexto"
```bash
# 1. Liste as sessões
claude-sessions

# 2. Veja a última sessão (primeira da lista)
claude-view <id>

# 3. Copie o contexto importante e cole numa nova conversa
```

### ✅ "Esqueci o que discutimos sobre autenticação"
```bash
# Busque o termo
claude-search "autenticação"

# Veja a sessão completa
claude-view <id>
```

### ✅ "Quero revisar o trabalho de ontem"
```bash
# Liste as sessões e procure pela data
claude-sessions

# Veja a sessão do dia anterior
claude-view <id>
```

---

## 💡 Dicas

### Use IDs Curtos
Não precisa digitar o ID completo! Apenas os primeiros 8 caracteres:
```bash
# Ao invés de:
claude-view 065fa436-095b-4fad-8d2d-75cee27a3de4

# Use:
claude-view 065fa436
```

### Copie para Arquivo
Para reler com calma ou colar numa nova conversa:
```bash
claude-view 065fa436 > ~/Desktop/conversa.txt
```

### Combine com Grep
Para buscar dentro de uma sessão específica:
```bash
claude-view 065fa436 | grep -i "error"
```

---

## 🔧 Desinstalação

```bash
rm ~/.local/bin/claude-sessions
rm ~/.local/bin/claude-view
rm ~/.local/bin/claude-search
```

---

## 📊 Como Funciona

O Claude Code salva automaticamente todas as conversas em:
```
~/.claude/history.jsonl
```

Este pacote simplesmente:
1. Lê esse arquivo JSONL
2. Formata e exibe as informações de forma legível
3. Permite buscar e filtrar

**Zero tokens extras são gastos** - você está apenas relendo o que já foi escrito!

---

## ⚙️ Requisitos

- **Python 3.6+** (já vem instalado no macOS/Linux)
- **Claude Code** instalado (CLI ou IDE)
- **Histórico de conversas** existente em `~/.claude/history.jsonl`

---

## 🐛 Problemas Conhecidos

### "Arquivo de histórico não encontrado"
**Causa:** Você ainda não teve conversas com Claude Code, ou ele está instalado em local diferente.

**Solução:**
- Verifique se `~/.claude/history.jsonl` existe
- Tenha pelo menos uma conversa no Claude Code
- Se usar Windows, o caminho pode ser diferente

### "Sessão não encontrada"
**Causa:** ID digitado incorretamente ou sessão muito antiga (já foi limpa).

**Solução:**
- Use `claude-sessions` para listar IDs disponíveis
- Confira se digitou corretamente (mínimo 8 caracteres)

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:
- Abrir issues
- Enviar pull requests
- Sugerir melhorias

---

## 📄 Licença

MIT License - Use livremente!

---

## 🙏 Créditos

Criado por usuários do Claude Code que estavam cansados de perder contexto. 😅

---

## 📞 Suporte

Se tiver problemas:
1. Verifique a seção **Problemas Conhecidos** acima
2. Confira se o Claude Code está instalado corretamente
3. Abra uma issue no GitHub

---

**Versão:** 1.0.0
**Última atualização:** 12/11/2025

---

## 🎉 Bom Código!

Nunca mais perca contexto. Aproveite suas conversas com Claude ao máximo! 🚀
