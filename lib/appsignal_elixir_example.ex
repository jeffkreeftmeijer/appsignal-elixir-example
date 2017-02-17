defmodule AppsignalElixirExample do
  use Appsignal.Instrumentation.Decorators

  @decorate transaction(:background_job)
  def my_background_job do
    my_function()
  end

  @decorate transaction_event()
  def my_function do
    :timer.sleep(1000)
  end
end
