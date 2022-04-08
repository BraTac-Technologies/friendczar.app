defmodule FriendczarWeb.RoomLive do
  use FriendczarWeb, :live_view

  alias Friendczar.Repo
  alias FriendczarWeb.ChatView
  alias Friendczar.Accounts
  alias Friendczar.Messages
  alias Friendczar.Messages.Message


  def render(assigns) do
   render ChatView, "room.html", assigns
  end


  def mount(params, session, socket) do
    if connected?(socket), do: Messages.subscribe()
    selected_user = Accounts.get_user!(params["id"])
    current_user_token = session["user_token"]
    current_user = Accounts.get_user_by_session_token(current_user_token)
    changeset_for_message = Messages.change_message(%Message{})
    messages = Messages.list_messages_by_users(current_user, selected_user) |> Repo.preload(:current_user)
    socket = assign(
        socket,
        selected_user: selected_user,
        current_user: current_user,
        messages: messages,
        changeset_for_message: changeset_for_message
      )
    {:ok, socket}
  end


  def handle_event("send_message", %{"message" => attrs}, socket) do

    case Messages.create_message(attrs) do
      {:ok, message} ->

        changeset_for_message = Messages.change_message(%Message{})
        socket = assign(socket, changeset_for_message: changeset_for_message)
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset_for_message} ->

        socket = assign(socket, changeset_for_message: changeset_for_message)
        {:noreply, socket}

      end

  end

  def handle_info({:message_created, message}, socket) do
    socket =
      update(
        socket,
        :messages,
        fn messages -> [message | messages] end
      )
    {:noreply, socket}
  end

end
