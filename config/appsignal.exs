use Mix.Config

config :appsignal, :config,
  active: true,
  otp_app: :appsignal_elixir_example,
  name: "appsignal_elixir_example",
  push_api_key: "00000000-0000-0000-0000-000000000000",
  env: Mix.env

