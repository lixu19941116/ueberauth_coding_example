defmodule UeberauthCodingExample.Web.PageController do
  use UeberauthCodingExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end