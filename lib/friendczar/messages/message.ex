defmodule Friendczar.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Friendczar.Accounts.User

  schema "messages" do

    belongs_to :current_user, User
    belongs_to :selected_user, User

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:current_user_id, :selected_user_id])
    # |> validate_required([:current_user_id, :selected_user_id])
  end
end
