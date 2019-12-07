defmodule HttpEditorTest do
  use ExUnit.Case
  doctest Proxy

  test "h1 to h6" do
    body = "<h1> Olar </h1>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end

  test "h2 to h6" do
    body = "<h2> Olar </h2>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end

  test "h3 to h6" do
    body = "<h3> Olar </h3>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end

  test "h4 to h6" do
    body = "<h4> Olar </h4>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end

  test "returns true to sitensfw" do
    site_to_block = "sitensfw.com.br"
    assert true == HttpEditor.site_blocked?(site_to_block)
  end

  test "returns true to neverssl" do
    site_to_block = "bfhdzmlcrnswvkxt.neverssl.com"
    assert true == HttpEditor.site_blocked?(site_to_block)
  end

  test "returns true to neverssl with resources" do
    site_to_block = "bfhdzmlcrnswvkxt.neverssl.com/online"
    assert true == HttpEditor.site_blocked?(site_to_block)
  end
end
