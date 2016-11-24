use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app, App.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :app, App.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "myapp",
  password: "myapp",
  database: "myapp",
  hostname: "postgresql", # link with postgresql container
  pool: Ecto.Adapters.SQL.Sandbox
