defmodule FriendczarWeb.PageController do
  use FriendczarWeb, :controller

  alias Friendczar.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def user(conn, _) do
    render(conn, "user.html")
  end

end
