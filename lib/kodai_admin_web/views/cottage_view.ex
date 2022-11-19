defmodule KodaiAdminWeb.CottageView do
  use KodaiAdminWeb, :view
  alias KodaiAdminWeb.CottageView

  def render("index.json", %{cottages: cottages}) do
    %{data: render_many(cottages, CottageView, "cottage.json")}
  end

  def render("show.json", %{cottage: cottage}) do
    %{data: render_one(cottage, CottageView, "cottage.json")}
  end

  def render("cottage.json", %{cottage: cottage}) do
    %{
      id: cottage.id,
      name: cottage.name,
      location: cottage.location,
      rooms: cottage.rooms,
      persons_allowed: cottage.persons_allowed,
      price: cottage.price,
      images: cottage.images
    }
  end
end
