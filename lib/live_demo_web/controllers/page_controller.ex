defmodule LiveDemoWeb.PageController do
  use LiveDemoWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, LiveDemoWeb.LiveView, session: %{})
  end
end
