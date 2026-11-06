#!/usr/bin/env bash
# Publica este projeto como repositório no GitHub.
# Uso: ./publicar.sh [nome-do-repo] [public|private]
set -e

NOME="${1:-clonador-de-pastas-drive}"
VISIBILIDADE="${2:-public}"

cd "$(dirname "$0")"

if [ ! -d .git ]; then
  git init -b main
fi

git add .
git commit -m "Primeira versão: gerador de script para clonar pastas do Drive" || true
git branch -M main

if command -v gh >/dev/null 2>&1; then
  # Caminho automático (GitHub CLI): cria o repo, envia e ativa o GitHub Pages
  gh auth status >/dev/null 2>&1 || gh auth login
  gh repo create "$NOME" "--$VISIBILIDADE" --source=. --remote=origin --push
  if [ "$VISIBILIDADE" = "public" ]; then
    gh api -X POST "repos/{owner}/$NOME/pages" \
      -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true
    echo "Pronto. O site deve ficar em: https://$(gh api user -q .login).github.io/$NOME/"
  fi
else
  # Caminho manual: crie o repositório vazio em github.com/new e informe seu usuário
  read -rp "Seu usuário do GitHub: " USUARIO
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$USUARIO/$NOME.git"
  git push -u origin main
  echo "Enviado. Para ativar o site: Settings > Pages > Branch main > Save."
fi
