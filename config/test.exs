use Mix.Config

# Configure your database
config :todos, Todos.Repo,
  username: "postgres",
  password: "",
  database: "todos_test",
  hostname: "localhost",
  port: 54320,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todos, TodosWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
config :bcrypt_elixir, :log_rounds, 4
