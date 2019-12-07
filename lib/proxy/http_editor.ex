defmodule HttpEditor do
  def edit_response_headers(headers) do
  end

  def edit_response_body(body) do
  end

  def edit_body(body) do
    String.replace(body, ~r/h\d/, "h6")
  end

  def site_blocked?(site) do
    filtered_site = String.replace(site, ~r/\/(.*)/, "")

    Enum.member?([
      "sitensfw.com.br",
      "bfhdzmlcrnswvkxt.neverssl.com"
    ], filtered_site)
  end


end
