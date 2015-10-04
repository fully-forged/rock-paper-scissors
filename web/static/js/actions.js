import State from './state';
import Socket from './socket';

const startGame = () => {
  Socket.startGame();
};

const joinGame = (gameUuid) => {
  Socket.joinGame(gameUuid);
};

const makeMove = (gameUuid, move) => {
  Socket.makeMove(gameUuid, move);
};

export default {
  joinGame,
  makeMove,
  startGame
};
