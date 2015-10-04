const initialData = {
  player: window.PLAYER_UUID,
  games: Immutable.Map({})
}

const facets = {
  gamesList: {
    cursors: {
      games: ['games']
    },
    get: function(data) {
      return data
        .games
        .valueSeq()
        .toList()
    }
  }
};

const options = {
  facets
};

const State = new Baobab(initialData, options);

export default State;
