defmodule FriendczarWeb.RoomLive do
  use FriendczarWeb, :live_view

  alias FriendczarWeb.Repo
  alias FriendczarWeb.ChatView


  def render(assigns) do
   render ChatView, "room.html", assigns
  end






end
