defmodule Instrumentation.Decorators do
  alias Appsignal.Transaction

  use Decorator.Define,
    transaction: 0

  def transaction(body, context) do
    decorate_event("", body, context)
  end

  defp decorate_event(postfix, body, context) do
    quote do
      transaction = Transaction.start(Transaction.generate_id, :background_job)
      |> Transaction.set_action(unquote("#{context.name}#{postfix}"))

      Appsignal.Instrumentation.Helpers.instrument(
        transaction,
        unquote("#{context.name}#{postfix}"),
        unquote("#{context.module}.#{context.name}"),
        fn -> unquote(body) end)
      Transaction.finish(transaction)
      :ok = Transaction.complete(transaction)
    end
  end
end

defmodule AppsignalElixirExample do
  use Instrumentation.Decorators

  @decorate transaction
  def sleep do
    time = :rand.uniform(1000)
    IO.puts(time)
    :timer.sleep(time)
  end
end
