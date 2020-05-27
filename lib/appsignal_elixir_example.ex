defmodule AppsignalElixirExample do
  @moduledoc """
  Documentation for `AppsignalElixirExample`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AppsignalElixirExample.hello()
      :world

  """
  def hello do
    Appsignal.instrument(fn span ->
      span
      |> Appsignal.Span.set_name("Testing!")
      |> Appsignal.Span.set_attribute("appsignal:category", "call.test")

      :timer.sleep(1_000)
      :world
    end)

    :timer.sleep(1_000)
  end
end
