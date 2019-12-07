defmodule Proxy.HttpProxyPlug do
  import Plug.Conn
  alias Proxy.{Cache, Utils}

  def init(opts), do: opts

  def call(conn, _opts) do
    url = Utils.build_url conn
    body = Utils.build_body conn
    method = String.to_atom(conn.method)
    conn = put_req_header(conn, "accept-encoding", "identity")
    request(method, url, body, conn)
  end

  def handleSiteBlocked(true, method, url, body, conn) do
    conn
      |> resp(401, "Blocked by proxy")
      |> send_resp()
  end

  def handleSiteBlocked(false, method, url, body, conn) do
    case HTTPoison.request(method, url, body, conn.req_headers) do
      {:ok, resp} ->

        # HERE
        new_body = HttpEditor.edit_body(resp.body)

        send_resp(
          %{ conn | resp_headers: resp.headers },
          resp.status_code,
          new_body
        )
      {:error, reason} ->
        conn
        |> send_resp(500, reason)
    end
  end

  def request(method, url, body, conn) do
    HttpEditor.site_blocked?(url)
    |> handleSiteBlocked(method, url, body, conn)
  end

end
