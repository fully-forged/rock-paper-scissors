defmodule RockPaperScissors.GameDispatcherManager do
  def start_link(manager, handler) do
    GenServer.start_link(__MODULE__, {manager, handler})
  end

  def init({manager, handler}) do
    start_handler(manager, handler)

    {:ok, manager}
  end

  def start_handler(manager, handler) do
    :ok = GenEvent.add_mon_handler(manager, handler, self)
  end

  def handle_info({:gen_event_EXIT, _handler_pid, _reason}, {manager, handler}) do
    start_handler(manager, handler)

    {:ok, manager}
  end
end
