COUNTER = {
    "R": "P",
    "P": "S",
    "S": "R",
}


def _mrugesh_prediction(game_number, my_history):
    previous_moves = my_history[:game_number - 1]
    last_ten = previous_moves[-10:]
    most_frequent = max(set(last_ten), key=last_ten.count)
    return COUNTER[most_frequent]


def _detect_bot(state):
    opponent = state["opponent"]
    mine = state["mine"]
    n = len(opponent)

    if n >= 8:
        start = max(1, n - 8)
        matches = 0
        valid = 0

        for index in range(start, n):
            game_number = index + 1
            expected = COUNTER[mine[game_number - 2]]
            valid += 1

            if opponent[index] == expected:
                matches += 1

        if valid >= 6 and matches == valid:
            return "kris"

    if n >= 18:
        matches = 0
        valid = 0

        for index in range(n - 8, n):
            game_number = index + 1

            if game_number < 11:
                continue

            expected = _mrugesh_prediction(game_number, mine)
            valid += 1

            if opponent[index] == expected:
                matches += 1

        if valid >= 6 and matches == valid:
            return "mrugesh"

    if n >= 10:
        if all(
            opponent[-1 - i] == opponent[-6 - i]
            for i in range(5)
        ):
            return "quincy"

    return None


def _predict_abbey(my_history):
    play_order = {
        "RR": 0,
        "RP": 0,
        "RS": 0,
        "PR": 0,
        "PP": 0,
        "PS": 0,
        "SR": 0,
        "SP": 0,
        "SS": 0,
    }

    history = ["R"] + my_history

    for first, second in zip(history, history[1:]):
        play_order[first + second] += 1

    previous = history[-1]
    possibilities = [
        previous + "R",
        previous + "P",
        previous + "S",
    ]

    predicted_my_move = max(
        possibilities,
        key=lambda pair: play_order[pair],
    )[-1]

    return COUNTER[predicted_my_move]


def player(
    prev_play,
    state={
        "opponent": [],
        "mine": [],
        "bot": None,
        "turn": 0,
    },
):
    if prev_play == "":
        state.clear()
        state.update({
            "opponent": [],
            "mine": [],
            "bot": None,
            "turn": 0,
        })
    else:
        state["opponent"].append(prev_play)

    turn = state["turn"] + 1

    detected = _detect_bot(state)
    if detected is not None:
        state["bot"] = detected

    if turn <= 2:
        guess = "S"

    else:
        if state["bot"] is None and len(state["opponent"]) >= 2:
            signature = "".join(state["opponent"][:2])

            signatures = {
                "RP": "quincy",
                "RR": "mrugesh",
                "PR": "kris",
                "PP": "abbey",
            }

            state["bot"] = signatures.get(signature)

        bot = state["bot"]

        if bot == "quincy":
            if len(state["opponent"]) >= 5:
                predicted_opponent = state["opponent"][-5]
            else:
                quincy_cycle = [
                    "R",
                    "P",
                    "P",
                    "S",
                    "R",
                ]
                predicted_opponent = quincy_cycle[(turn - 1) % 5]

            guess = COUNTER[predicted_opponent]

        elif bot == "kris":
            predicted_opponent = COUNTER[state["mine"][-1]]
            guess = COUNTER[predicted_opponent]

        elif bot == "mrugesh":
            mrugesh_history = ([""] + state["mine"])[-10:]

            most_frequent = max(
                set(mrugesh_history),
                key=mrugesh_history.count,
            )

            if most_frequent == "":
                most_frequent = "S"

            predicted_opponent = COUNTER[most_frequent]
            guess = COUNTER[predicted_opponent]

        elif bot == "abbey":
            predicted_opponent = _predict_abbey(state["mine"])
            guess = COUNTER[predicted_opponent]

        else:
            context = state["mine"][-1]
            responses = []

            for index, opponent_move in enumerate(state["opponent"]):
                game_number = index + 1

                if game_number >= 2:
                    previous_my_move = state["mine"][game_number - 2]

                    if previous_my_move == context:
                        responses.append(opponent_move)

            if responses:
                predicted_opponent = max(
                    set(responses),
                    key=responses.count,
                )
                guess = COUNTER[predicted_opponent]
            else:
                guess = "R"

    state["mine"].append(guess)
    state["turn"] += 1

    return guess
