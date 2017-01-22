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
      build_embedded:   Mix.env == :prod,
      deps:             deps(),
      description:      description(),
      elixir:           "~> 1.4",
      package:          package(),
      start_permanent:  Mix.env == :prod,
      version:          version()
    ]
  end

  ###########
  # Private #
  ###########

  defp deps() do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:httpoison, "~> 0.11.0"},
      {:poison, "~> 3.0"}
    ]
  end

  defp description() do
    """
    A collection of functions that hoove (aka fetch) data from remote sources.
    """
  end

  defp extra_applications() do
    [
      :httpoison,
      :logger,
      :poison
    ]
  end

  defp links() do
    %{
      "GitHub" => "https://github.com/amorphid/hoover-elixir"
    }
  end

  defp licenses() do
    for license <- ["LICENSE.md"] do
      File.stream!(license)
      |> Enum.at(0)
      |> String.trim()
    end
  end

  defp maintainers() do
    [
      "Michael Pope"
    ]
  end

  defp package() do
    [
      licenses:    licenses(),
      links:       links(),
      maintainers: maintainers()
    ]
  end

  defp version() do
    File.stream!("VERSION.txt")
    |> Enum.at(0)
    |> String.trim()
  end
end
