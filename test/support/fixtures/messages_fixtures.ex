defmodule Friendczar.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Friendczar.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        current_user_id: 42,
        selected_user_id: 42
      })
      |> Friendczar.Messages.create_message()

    message
  end
end
