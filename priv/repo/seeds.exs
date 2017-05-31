# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JustpushitApi.Repo.insert!(%JustpushitApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Fixtures do
  def link do
    JustpushitApi.Repo.insert! %JustpushitApi.Link{
      title: FakerElixir.Name.title,
      description: FakerElixir.Lorem.sentences(3..5),
      url: FakerElixir.Internet.url,
      source: "string",
      published_at: FakerElixir.Date.backward(1..50) |> Ecto.DateTime.cast |> elem(1)
      # {:ok, published_at} = FakerElixir.Date.backward(1..50) |> Ecto.DateTime.cast
    }
  end
  # def clear do
  #   JustpushitApi.Repo.delete_all JustpushitApi.Link
  # end
end

#Fixtures.clear
posts = Stream.repeatedly(fn -> Fixtures.link end)
posts |> Enum.take(20)
