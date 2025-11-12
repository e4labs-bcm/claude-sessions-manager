# 📦 Guia de Distribuição - Claude Sessions Manager

Como compartilhar este pacote com outros usuários.

---

## 🚀 Método 1: GitHub (Recomendado)

### 1. Criar repositório no GitHub
```bash
# 1. Crie um repositório novo no GitHub (via interface web)
#    Nome sugerido: claude-sessions-manager
#    Descrição: "Nunca mais perca o contexto das suas conversas com Claude Code!"

# 2. Inicialize o git (se ainda não foi)
cd claude-sessions-manager
git init

# 3. Adicione os arquivos
git add .

# 4. Faça o commit inicial
git commit -m "feat: Lançamento inicial v1.0.0"

# 5. Conecte ao repositório remoto
git remote add origin https://github.com/SEU_USUARIO/claude-sessions-manager.git

# 6. Envie para o GitHub
git branch -M main
git push -u origin main
```

### 2. Criar Release
1. Vá em **Releases** → **Create a new release**
2. Tag: `v1.0.0`
3. Title: `Claude Sessions Manager v1.0.0`
4. Descrição:
   ```markdown
   # 📚 Claude Sessions Manager v1.0.0

   Primeiro lançamento público!

   ## Funcionalidades
   - ✅ Listar histórico de sessões do Claude CLI
   - ✅ Ver conversas completas
   - ✅ Buscar por palavra-chave
   - ✅ Zero tokens extras usados

   ## Instalação
   ```bash
   bash install.sh
   ```

   Veja README.md para documentação completa.
   ```

### 3. Compartilhar
Agora é só compartilhar o link:
```
https://github.com/SEU_USUARIO/claude-sessions-manager
```

**Instalação para usuários:**
```bash
git clone https://github.com/SEU_USUARIO/claude-sessions-manager.git
cd claude-sessions-manager
bash install.sh
```

---

## 📦 Método 2: Arquivo Compactado

### Criar arquivo .tar.gz
```bash
cd /Users/agathafiuza/Documents/Claude/hub-app-nextjs
tar -czf claude-sessions-manager-v1.0.0.tar.gz claude-sessions-manager/
```

**Ou criar .zip:**
```bash
zip -r claude-sessions-manager-v1.0.0.zip claude-sessions-manager/
```

### Compartilhar
- Envie por email
- Suba no Google Drive / Dropbox
- Anexe em um gist do GitHub

**Instalação para usuários:**
```bash
# Extrair
tar -xzf claude-sessions-manager-v1.0.0.tar.gz
# ou: unzip claude-sessions-manager-v1.0.0.zip

# Instalar
cd claude-sessions-manager
bash install.sh
```

---

## 🌐 Método 3: Gist do GitHub (Mais simples)

Para compartilhamento rápido:

1. Vá em https://gist.github.com/
2. Crie um gist com todos os arquivos:
   - `claude-sessions` (script)
   - `claude-view` (script)
   - `claude-search` (script)
   - `install.sh` (script)
   - `README.md` (documentação)

3. Marque como **Public**
4. Compartilhe o link do gist

**Instalação para usuários:**
```bash
# Baixar arquivos do gist
curl -O https://gist.githubusercontent.com/SEU_USUARIO/GIST_ID/raw/claude-sessions
curl -O https://gist.githubusercontent.com/SEU_USUARIO/GIST_ID/raw/claude-view
curl -O https://gist.githubusercontent.com/SEU_USUARIO/GIST_ID/raw/claude-search
curl -O https://gist.githubusercontent.com/SEU_USUARIO/GIST_ID/raw/install.sh

# Tornar executável
chmod +x claude-sessions claude-view claude-search install.sh

# Instalar
bash install.sh
```

---

## 📱 Método 4: Reddit / Fóruns

Poste em comunidades relevantes:

- r/ClaudeAI
- r/LLMs
- r/programming
- Hacker News
- Dev.to

**Template de post:**
```markdown
# 📚 Criei uma ferramenta para nunca mais perder contexto do Claude Code

Cansado de perder o contexto da conversa quando o Claude Code reinicia?

Criei o **Claude Sessions Manager** - uma ferramenta CLI simples que permite:
- ✅ Navegar pelo histórico completo das suas conversas
- ✅ Buscar conversas passadas por palavra-chave
- ✅ Recuperar contexto após crashes
- ✅ Zero tokens extras usados

GitHub: https://github.com/e4labs-bcm/claude-sessions-manager

Instalação em uma linha:
```bash
bash <(curl -s https://raw.githubusercontent.com/e4labs-bcm/claude-sessions-manager/main/install.sh)
```

Adoraria receber feedback!
```

---

## 🎯 Checklist Antes de Compartilhar

- [ ] Todos os scripts têm `#!/usr/bin/env python3` ou `#!/bin/bash`
- [ ] Todos os scripts são executáveis (`chmod +x`)
- [ ] README.md está completo
- [ ] LICENSE está presente (MIT)
- [ ] Testou instalação em sistema limpo
- [ ] Testou todos os 3 comandos (`claude-sessions`, `claude-view`, `claude-search`)
- [ ] Documentação menciona requisitos (Python 3.6+, Claude Code)

---

## 📊 Estrutura Final do Pacote

```
claude-sessions-manager/
├── README.md              # Documentação principal
├── LICENSE               # MIT License
├── DISTRIBUTION.md       # Este arquivo
├── install.sh            # Instalador automático
├── uninstall.sh          # Desinstalador
├── claude-sessions       # Script principal (lista)
├── claude-view           # Script para ver sessão
└── claude-search         # Script para buscar
```

---

## 🎉 Pronto para Compartilhar!

Escolha o método que preferir e ajude outros desenvolvedores a não perderem mais contexto! 🚀

---

**Versão:** 1.0.0
**Data:** 12/11/2025
