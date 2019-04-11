defmodule AppsignalElixirExample do
  import Appsignal.Instrumentation.Helpers, only: [instrument: 4]

  def instrumentation do
    transaction =
      Appsignal.Transaction.generate_id()
      |> Appsignal.Transaction.start(:http_request)
      |> Appsignal.Transaction.set_action("AppsignalElixirExample.instrumentation")

    instrument(transaction, "query.posts", "Fetching all posts", fn ->
      :timer.sleep(1000)
    end)

    Appsignal.Transaction.finish(transaction)
    :ok = Appsignal.Transaction.complete(transaction)
  end
end
