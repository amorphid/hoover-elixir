defmodule Hoover.Mixfile do
  use Mix.Project

  ##########
  # Public #
  ##########

  def application() do
    [
      extra_applications: extra_applications(),
      mod:                {Hoover.Application, []}
    ]
  end

  def project() do
    [
      app:              :hoover,
      deps:             deps(),
      elixir:           "~> 1.4",
      build_embedded:   Mix.env == :prod,
      start_permanent:  Mix.env == :prod,
      version:          "0.1.0"
    ]
  end

  ###########
  # Private #
  ###########

  defp deps() do
    [
      {:httpoison, "~> 0.11.0"},
      {:poison, "~> 3.0"}
    ]
  end

  defp extra_applications() do
    [
      :httpoison,
      :logger,
      :poison
    ]
  end
end
