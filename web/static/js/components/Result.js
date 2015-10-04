const resultText = (player, result) => {
  switch(result) {
    case "draw":
      return "Draw";
      break;
    case player:
      return "Win!";
      break;
    default:
      return "Too bad";
      break;
  }
};

class Result extends React.Component {
  render() {
    let game = this.props.game;
    let player = this.props.player;

    return (
      <span className="notice">
        {resultText(player, game.winner)}
      </span>
    );
  }
}

export default Result;
