defmodule Ethereumex do
  @moduledoc File.read!("#{__DIR__}/../README.md")

  use Application
  import Supervisor.Spec, warn: false

  alias Ethereumex.Config
  alias Ethereumex.Counter

  def start(_type, _args) do
    :ok = Counter.setup()
    children = Config.setup_children()
    opts = [strategy: :one_for_one, name: Ethereumex.Supervisor, max_seconds: 20]
    Supervisor.start_link(children, opts)
  end
end
