defmodule Friendczar.MessagesTest do
  use Friendczar.DataCase

  alias Friendczar.Messages

  describe "messages" do
    alias Friendczar.Messages.Message

    import Friendczar.MessagesFixtures

    @invalid_attrs %{current_user_id: nil, selected_user_id: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{current_user_id: 42, selected_user_id: 42}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
      assert message.current_user_id == 42
      assert message.selected_user_id == 42
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{current_user_id: 43, selected_user_id: 43}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
      assert message.current_user_id == 43
      assert message.selected_user_id == 43
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
