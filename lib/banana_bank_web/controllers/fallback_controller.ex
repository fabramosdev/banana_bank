defmodule BananaBankWeb.FallbackController do
  use BananaBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(404)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
