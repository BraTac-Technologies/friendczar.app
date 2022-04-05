defmodule FriendczarWeb.UserLive do
  use FriendczarWeb, :live_view

  alias FriendczarWeb.Repo
  alias FriendczarWeb.UserView


  def render(assigns) do
   render UserView, "show.html", assigns
  end






end
