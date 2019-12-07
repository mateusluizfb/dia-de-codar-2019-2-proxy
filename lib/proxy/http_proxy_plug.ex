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

  def request(method, url, body, conn) do
    case HTTPoison.request(method, url, body, conn.req_headers) do
      {:ok, resp} ->

        # HERE

        body_temp = HttpEditor.edit_body(resp.body)
        body_temp = HttpEditor.change_twitter_link(body_temp)

        IO.puts body_temp

        send_resp(
          %{ conn | resp_headers: resp.headers },
          resp.status_code,
          body_temp
        )
      {:error, reason} ->
        conn
        |> send_resp(500, reason)
    end
  end

end
