defmodule Proxy.Mixfile do
  use Mix.Project

  def project do
    [app: :proxy,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger,
                    :cowboy,
                    :plug,
                    :httpoison,
                    :socket,
                    :timex,
                    :observer,
                    :wx,
                    :runtime_tools],
     mod: {Proxy, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:distillery, "~> 2.1"},
      {:httpoison, "~> 0.8.0"},
      {:socket, "~> 0.3"},
      {:timex, "~> 1.0.0"},
   ]
  end
end
