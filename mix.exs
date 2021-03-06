defmodule SetupPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :setup_phoenix,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SetupPhoenix.Application, []},
      extra_applications: [:logger, :runtime_tools, :rollbax, :beaker, :plug_logger_json, :comeonin, :timex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.2", override: true}, # beaker depedency problem
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.13"},
      {:cowboy, "~> 1.1"},
      {:apex, "~> 1.2"},
      {:credo, "~> 0.9", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.8", only: [:dev, :test]},
      {:junit_formatter, "~> 2.2", only: [:test]},
      {:rollbax, "~> 0.6"},
      {:guardian, "~> 1.0"},
      {:beaker, ">= 1.2.0"},
      {:plug_logger_json, "~> 0.6.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~> 4.0"},
      {:swoosh, "~> 0.14"},
      {:gen_smtp, "~> 0.12.0"},
      {:phoenix_swoosh, "~> 0.2"},
      {:timex, "~> 3.1"},
      {:timex_ecto, "~> 3.0"},
      {:bodyguard, "~> 2.1"},
      {:arc, "~> 0.10.0"},
      {:arc_ecto, "~> 0.10.0"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
