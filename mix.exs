defmodule Mailroom.Mixfile do
  use Mix.Project

  @github_url "https://github.com/andrewtimberlake/mailroom"
  @version "0.0.1"

  def project do
    [app: :mailroom,
     name: "Mailroom",
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     source_url: @github_url,
     docs: fn ->
       [
         source_ref: "v#{@version}",
         canonical: "http://hexdocs.pm/mailroom",
         main: "Mailroom",
         source_url: @github_url,
         extras: ["README.md"]
       ]
     end,
     description: description(),
     package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
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
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:timex, "~> 3.1", optional: true},
      # DEV
      {:credo, "~> 0.8", only: :dev},
      # Docs
      {:ex_doc, "~> 0.18", only: [:dev, :docs]},
      {:earmark, "~> 1.2", only: [:dev, :docs]},
    ]
  end

  defp description do
    """
    A library for sending, receving and processing emails.
    """
  end

  defp package do
    [
      maintainers: ["Andrew Timberlake"],
      contributors: ["Andrew Timberlake"],
      licenses: ["MIT"],
      links: %{"Github" => @github_url}
    ]
  end
end
