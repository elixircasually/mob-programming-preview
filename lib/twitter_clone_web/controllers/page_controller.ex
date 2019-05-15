defmodule TwitterCloneWeb.PageController do
  use TwitterCloneWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, TwitterCloneWeb.FeedView, session: %{})
  end
end
