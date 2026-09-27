# Rock Paper Scissors

Project from the freeCodeCamp **Machine Learning with Python** certification.

The goal is to implement the `player` function in `RPS.py` so it can play Rock Paper Scissors against four different opponents (`quincy`, `abbey`, `kris`, and `mrugesh`) and achieve at least a **60% win rate against each one**.

## Files

- `RPS.py` — strategy implemented for the challenge.
- `RPS_game.py` — official game engine provided by freeCodeCamp; it was not modified.
- `main.py` — development entry point used to run matches and tests.
- `test_module.py` — official unit tests for the challenge.

## Run

```bash
python main.py
```

To run the unit tests directly:

```bash
python -m unittest test_module.py
```

## Challenge Requirement

The `player(prev_play)` function must return `R`, `P`, or `S` and win at least 60% of the games against each of the four bots evaluated by freeCodeCamp.
