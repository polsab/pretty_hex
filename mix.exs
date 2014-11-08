defmodule PrettyHex.Mixfile do
  use Mix.Project

  def project do
    [app: :pretty_hex,
     version: "0.0.1",
     elixir: "~> 1.0",
     source_url: "https://github.com/polsab/pretty_hex",
     deps: deps,
     package: [
       contributors: ["Paul Sabanal"],
       licenses: ["Apache 2.0"],
       links: %{github: "https://github.com/polsab/pretty_hex"}],
       description: """
       A binary hex dumping library in Elixir.
       """]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    
  end
end
