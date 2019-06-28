defmodule LiveDemoWeb.LiveView do
  use Phoenix.LiveView

  def render(assigns) do
    LiveDemoWeb.PageView.render("live.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Ready")}
  end

  def handle_event("github_deploy", _value, socket) do
    Process.send_after(self(), :create_org, 1000)
    {:noreply, assign(socket, deploy_step: "Starting deploy...")}
  end

  def handle_info(:create_org, socket) do
    Process.send_after(self(), :create_repo, 1000)
    {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
  end

  def handle_info(:create_repo, socket) do
    Process.send_after(self(), :push_contents, 1000)
    {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
  end

  def handle_info(:push_contents, socket) do
    Process.send_after(self(), :done, 1000)
    {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
  end

  def handle_info(:done, socket) do
    {:noreply, assign(socket, deploy_step: "Done!")}
  end
end
