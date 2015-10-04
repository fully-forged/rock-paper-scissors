import Actions from '../actions';
const availableMoves = ['rock', 'paper', 'scissors'];

const makeMove = (game, move) => {
  Actions.makeMove(game.uuid, move);
};

class Moves extends React.Component {
  render() {
    let game = this.props.game;
    let buttons = availableMoves.map(move => {
      return (
        <button
          key={move}
          onClick={() => { makeMove(game, move) }}>{move[0].toUpperCase()}</button>
      )
    });

    return (
      <div className="moves">
        {buttons}
      </div>
    );
  }
}

export default Moves;
