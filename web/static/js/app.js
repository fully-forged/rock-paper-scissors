import "deps/phoenix_html/web/static/js/phoenix_html"
import socket from "./socket";
import GamesList from './components/GamesList';

React.render(<GamesList />, document.getElementById('main'));
