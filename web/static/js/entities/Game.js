const Game = Immutable.Record({
  uuid: null,
  players: Immutable.Map(),
  winner: null
});

export default Game;
