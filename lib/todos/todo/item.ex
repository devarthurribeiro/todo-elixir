defmodule Todos.Todo.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "itens" do
    field :is_checked, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:is_checked, :title])
    |> validate_required([:is_checked, :title])
  end
end
