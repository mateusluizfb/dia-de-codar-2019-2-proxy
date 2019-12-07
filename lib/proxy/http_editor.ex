defmodule HttpEditor do
  def edit_response_headers(headers) do
  end

  def edit_response_body(body) do
  end

  def edit_body(body) do
    String.replace(body, ~r/h\d/, "h6")
  end

  def site_blocked?(site) do

    Enum.member?([
      "sitensfw.com.br",
      "bfhdzmlcrnswvkxt.neverssl.com",
      "bfhdzmlcrnswvkxt.neverssl.com/online"
    ], site)
  end
end
