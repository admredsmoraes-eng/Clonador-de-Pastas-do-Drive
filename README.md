# Clonador de Pastas do Drive

Ferramenta para copiar pastas inteiras do Google Drive, com subpastas e arquivos aninhados, algo que o Drive não faz nativamente.

O gerador (`index.html`) recebe os links da pasta de origem e da pasta de destino, extrai os IDs automaticamente e monta um script em **Google Apps Script**. O script percorre a pasta de forma recursiva, duplica todos os arquivos e recria a mesma hierarquia de subpastas no destino.

## Como usar

1. Abra o `index.html` no navegador (ou a versão publicada no GitHub Pages).
2. Cole o link completo da **pasta de origem** (a que você quer copiar) e da **pasta de destino** (onde a cópia ficará).
3. Clique em **Gerar Script Pronto**.
4. Clique em **Copiar Código**.
5. Acesse o [Google Apps Script](https://script.google.com/), crie um **Novo projeto**, apague o conteúdo padrão e cole o código.
6. Salve (ícone de disquete), selecione a função `copiarPastaInteira` e clique em **Executar**. Na primeira vez, autorize o acesso ao seu Google Drive.

## Observações

- A cópia é criada dentro do destino com o nome da pasta original seguido de ` (Cópia)`.
- O Apps Script tem limite de tempo de execução (cerca de 6 minutos por execução). Em pastas muito grandes, a execução pode ser interrompida antes de terminar.
- Tudo roda no navegador e na sua própria conta Google. Nenhum link ou dado é enviado a servidores externos.

## Estrutura do repositório

```
.
├── index.html      # Gerador de script (página única, sem dependências)
├── README.md
├── LICENSE
├── .gitignore
└── publicar.sh     # Publica este repositório no GitHub
```

## Licença

[MIT](LICENSE)
