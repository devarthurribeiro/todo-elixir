defmodule TodosWeb.ItemController do
  use TodosWeb, :controller

  alias Todos.Todo
  alias Todos.Todo.Item

  action_fallback TodosWeb.FallbackController

  def index(conn, _params) do
    itens = Todo.list_itens()
    render(conn, "index.json", itens: itens)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Todo.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Todo.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Todo.get_item!(id)

    with {:ok, %Item{} = item} <- Todo.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Todo.get_item!(id)

    with {:ok, %Item{}} <- Todo.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
