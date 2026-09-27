# Rock Paper Scissors

Projeto da certificação **Machine Learning with Python** do freeCodeCamp.

O objetivo é implementar a função `player` em `RPS.py` para jogar Pedra, Papel e Tesoura contra quatro oponentes diferentes (`quincy`, `abbey`, `kris` e `mrugesh`) e obter pelo menos **60% de vitórias contra cada um**.

## Arquivos

- `RPS.py` — estratégia implementada para o desafio.
- `RPS_game.py` — motor oficial do jogo fornecido pelo freeCodeCamp; não foi modificado.
- `main.py` — arquivo para execução e testes durante o desenvolvimento.
- `test_module.py` — testes unitários oficiais do desafio.

## Executar

```bash
python main.py
```

Para executar os testes diretamente:

```bash
python -m unittest test_module.py
```

## Requisito do desafio

A função `player(prev_play)` deve retornar `R`, `P` ou `S` e vencer pelo menos 60% das partidas contra cada um dos quatro bots avaliados pelo freeCodeCamp.
