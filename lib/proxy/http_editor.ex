defmodule HttpEditor do
  def edit_response_headers(headers) do
  end

  def edit_body(body) do
    String.replace(body, ~r/h\d/, h6)
  end

  def change_twitter_link(body) do
      String.replace(body, ~r(https://twitter.com\.*>), "instagram.com")
  end
end
