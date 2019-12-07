defmodule HttpEditorTest do
  use ExUnit.Case
  doctest Proxy

  test "the truth" do
    body = "<h3> Olar </h3>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end

  test "change h'n' to h6" do
    body = "<h2>Hello</h2>"
    assert "<h6>Hello</h6>" == HttpEditor.edit_body(body)
  end

  test "change to instagram.com" do

    href = "https://twitter.com/intent/follow?original_referer=http%3A%2F%2Fbfhdzmlcrnswvkxt.neverssl.com%2F&ref_src=twsrc%5Etfw&region=follow_link&screen_name=neverssl&tw_p=followbutton"

    body = "<a href=\"#{href}\"></a>"

    IO.puts body
    assert  "<a href=\"instagram.com\"></a>" == HttpEditor.change_twitter_link(body)
  end
end
