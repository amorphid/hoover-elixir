defmodule Hoover do
  @digital_ocean_api_key Application.fetch_env!(:hoover, :digital_ocean_api_key)
  @hackney_options Application.fetch_env!(:hoover, :hackney_options)

  def hoove_digital_ocean_images_list do
    HTTPoison.get!(
      "https://api.digitalocean.com/v2/images",
      [ "Authorization": "Bearer #{@digital_ocean_api_key}",
        "Content-Type": "application/json"],
      @hackney_options).body
    |> Poison.decode!()
  end
end
