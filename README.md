# Roblox Project

Estrutura base espelhando o Explorer do Roblox Studio, compatível com [Rojo](https://rojo.space/).

## Estrutura

```
src/
├── server/
│   ├── ServerScriptService/     → Scripts do lado servidor
│   └── ServerStorage/           → Objetos só acessíveis pelo servidor
│
├── client/
│   ├── StarterPlayerScripts/    → LocalScripts ao entrar no jogo
│   ├── StarterCharacterScripts/ → Scripts no personagem
│   ├── StarterGui/              → UI / ScreenGuis
│   └── ReplicatedFirst/         → Carregados antes de tudo
│
└── shared/
    ├── modules/   → ModuleScripts compartilhados
    ├── remotes/   → RemoteEvents e RemoteFunctions
    └── config/    → Configurações globais

assets/            → Imagens, sons e outros arquivos externos
```

## Como usar com Rojo

1. Instale o [Rojo](https://rojo.space/)
2. Rode `rojo serve` na pasta do projeto
3. Conecte pelo plugin do Rojo no Roblox Studio

> Os arquivos `placeholder.md` dentro das pastas podem ser apagados quando você começar a adicionar scripts.
