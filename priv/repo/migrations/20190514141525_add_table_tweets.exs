defmodule TwitterClone.Repo.Migrations.AddTableTweets do
  use Ecto.Migration

  def change do
    create table("tweets") do
      add :text,    :string, size: 280

      timestamps()
    end
  end
end
