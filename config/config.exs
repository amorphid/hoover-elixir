use Mix.Config

config :hoover, hackney_options: [ ssl: [{:versions, [:'tlsv1.2']}] ]

import_config "config.secret.exs"
