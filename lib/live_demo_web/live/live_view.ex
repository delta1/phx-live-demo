defmodule LiveDemoWeb.LiveView do
  use Phoenix.LiveView
  alias LiveDemo.Items
  alias Phoenix.PubSub
  @alpha String.split("abcdef123456", "", trim: true)

  def render(assigns) do
    LiveDemoWeb.PageView.render("live.html", assigns)
  end

  def mount(_session, socket) do
    # list the items
    items = Items.list_items()
    # subscribe to new items?
    # Endpoint.subscribe("item:new")
    PubSub.subscribe(LiveDemo.PubSub, "items:crud")
    # assign
    {:ok, assign(socket, items: items)}
  end

  def random_name() do
    1..10
    |> Enum.reduce([], fn _, acc -> [Enum.random(@alpha) | acc] end)
    |> Enum.join("")
  end

  def handle_event("new", _value, socket) do
    # create a new item with a random name from our alphabet
    Items.create_item(%{
      name: random_name(),
      status: Enum.random(["created", "updated", "done"])
    })

    # pubsub broadcast happens in Items context /lib/live_demo/items.ex
    {:noreply, socket}
  end

  def handle_event("change", map, socket) do
    [id] = Map.keys(map)
    [status] = Map.values(map)

    Items.get_item!(id)
    |> Items.update_item(%{status: status})

    {:noreply, socket}
  end

  def handle_info(:update, socket) do
    items = Items.list_items()
    {:noreply, assign(socket, items: items)}
  end
end
