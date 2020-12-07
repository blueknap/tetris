defmodule Tetrisui.Repo do
  use Ecto.Repo,
    otp_app: :tetrisui,
    adapter: Ecto.Adapters.Postgres
end
