defmodule TodosWeb.ItemView do
  use TodosWeb, :view
  alias TodosWeb.ItemView

  def render("index.json", %{itens: itens}) do
    %{data: render_many(itens, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      is_checked: item.is_checked,
      title: item.title}
  end
end
