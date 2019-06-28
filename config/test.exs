use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_demo, LiveDemoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :live_demo, LiveDemo.Repo,
  username: "postgres",
  password: "postgres",
  database: "live_demo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
