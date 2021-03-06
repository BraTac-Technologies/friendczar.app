defmodule Friendczar.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add(:current_user_id, references(:users, on_delete: :delete_all))
      add(:selected_user_id, references(:users, on_delete: :delete_all))
      timestamps()
    end
  end
end
