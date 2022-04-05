defmodule FriendczarWeb.RoomLive do
  use FriendczarWeb, :live_view

  alias FriendczarWeb.Repo
  alias FriendczarWeb.ChatView
  alias Friendczar.Accounts


  def render(assigns) do
   render ChatView, "room.html", assigns
  end


  def mount(params, session, socket) do
    selected_user = Accounts.get_user!(params["id"])
    current_user_token = session["user_token"]
    current_user = Accounts.get_user_by_session_token(current_user_token)
    IO.inspect(current_user, label: "HERE===>")
    socket = assign(
        socket,
        selected_user: selected_user,
        current_user: current_user
      )
    {:ok, socket}
  end



end
