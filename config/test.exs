import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :razoyo_elixir, RazoyoElixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PWpwkgrmSqM6q7szE5Vb+t/oXEbO/1EwGy5R+su5gNlleQCmY6V/DHQtcKmRsVg7",
  server: false

# In test we don't send emails.
config :razoyo_elixir, RazoyoElixir.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
