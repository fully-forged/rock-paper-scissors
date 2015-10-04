import State from '../state';
import Actions from '../actions';
import Game from './Game';

let gamesList = State.facets.gamesList;
let currentPlayer = State.select('player');

class GamesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      games: Immutable.List(),
      player: currentPlayer.get()
    }
  }
  componentDidMount() {
    this.onNewData = () => {
      this.setState({
        games: gamesList.get()
      });
    };
    gamesList.on('update', this.onNewData);
  }
  componentWillUnmount() {
    gamesList.off('update', this.onNewData);
  }
  render() {
    let games = this.state.games.map(game => {
      return <Game game={game} key={game.uuid} player={this.state.player} />
    });
    return (
      <section id="games">
        <header>
          <h1>Available games</h1>
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
