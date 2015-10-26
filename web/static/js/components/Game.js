import Actions from '../actions';
import Moves from './Moves';
import Result from './Result';

const available = (game) => {
  return game.players.size < 2;
};

const joinable = (game, player) => {
  return !game.players.has(player);
};

const joined = (game, player) => {
  return game.players.has(player);
}

const madeMove = (game, player) => {
  return joined(game, player) && game.players.get(player).moved;
}

const finished = (game, player) => {
  return game.winner !== null;
}

class Game extends React.Component {
  render() {
    let game = this.props.game;
    let player = this.props.player;
    let actions;

    switch (true) {
      case joined(game, player) && finished(game, player):
        actions = <Result game={game} player={player} />;
        break;
      case madeMove(game, player):
        actions = <span className="notice">Waiting for opponent</span>;
        break;
      case available(game) && joinable(game, player):
        actions = <button onClick={this.joinGame.bind(this)}>Join</button>;
        break;
      case joined(game, player):
        actions = <Moves game={game} />
        break;
      case !available(game):
        actions = <span className="notice">Already full</span>;
        break;
    }

    return (
      <div className="game">
        {actions}
      </div>
    )
  }
  joinGame() {
    Actions.joinGame(this.props.game.uuid);
  }
}

export default Game;
