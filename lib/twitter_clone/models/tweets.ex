defmodule TwitterClone.Model.Tweet do
  use Ecto.Schema
  import Ecto.Query

  schema "tweets" do
    field :text, :string

    timestamps()
  end

  def insert(text) do
    TwitterClone.Repo.insert(%__MODULE__{text: text})
  end

  def all() do
    __MODULE__
    |> order_by(desc: :inserted_at)
    |> TwitterClone.Repo.all()
  end
end
