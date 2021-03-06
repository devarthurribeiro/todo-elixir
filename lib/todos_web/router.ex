defmodule TodosWeb.Router do
  use TodosWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodosWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/itens", ItemController, except: [:new, :edit]
  end
end
