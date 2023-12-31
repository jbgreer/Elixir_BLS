defmodule BalancedLatinSquare.MixProject do
  use Mix.Project

  def project do
    [
      app: :balanced_latin_square,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # relocate dialyzer output to priv/plts directory
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/project.plt"}
      ],
      docs: [
        main: "BalancedLatinSquare",
        extras: ["README.md"]
      ],
      test_coverage: [tool: ExCoveralls, export: "cov"],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.details": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4.1", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.17.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:doctor, "~> 0.21.0", only: [:dev], runtime: false}
    ]
  end
end
