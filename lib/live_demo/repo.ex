defmodule LiveDemo.Repo do
  use Ecto.Repo,
    otp_app: :live_demo,
    adapter: Ecto.Adapters.Postgres
end
