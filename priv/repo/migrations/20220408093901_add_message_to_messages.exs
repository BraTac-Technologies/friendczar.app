defmodule Friendczar.Repo.Migrations.AddMessageToMessages do
  use Ecto.Migration

  def change do
    alter table("messages") do
      add :message, :text
    end
  end
end
