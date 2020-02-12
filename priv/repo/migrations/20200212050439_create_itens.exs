defmodule Todos.Repo.Migrations.CreateItens do
  use Ecto.Migration

  def change do
    create table(:itens) do
      add :is_checked, :boolean, default: false, null: false
      add :title, :string

      timestamps()
    end

  end
end
