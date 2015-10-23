import State from '../state';
import Actions from '../actions';
import Game from './Game';

let gamesList = State.facets.gamesList;
let currentPlayer = State.select('player');
let currentScore = State.select('score');

class GamesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      games: Immutable.List(),
      player: currentPlayer.get(),
      score: currentScore.get()
    }
  }
  componentDidMount() {
    this.onNewData = () => {
      this.setState({
        games: gamesList.get(),
        score: currentScore.get()
      });
    };
    gamesList.on('update', this.onNewData);
    currentScore.on('update', this.onNewData);
  }
  componentWillUnmount() {
    gamesList.off('update', this.onNewData);
    currentScore.off('update', this.onNewData);
  }
  render() {
    let games = this.state.games.map(game => {
      return <Game game={game} key={game.uuid} player={this.state.player} />
    });
    return (
      <section id="games">
        <header>
          <h1>Your score: { this.state.score }</h1>
          <button onClick={() => Actions.startGame() }>+</button>
        </header>
        <div className="list">
          {games}
        </div>
      </section>
    );
  }
}

export default GamesList;
