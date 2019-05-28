defmodule InstantPoll.EctoType.StringsList do

  @behaviour Ecto.Type
  def type, do: {:array, :string}

  def cast(nil), do: {:ok, []}
  def cast(arr) when is_list(arr) do
    {:ok, reject_blank(arr)}
  end

  def dump(val), do: {:ok, val}
  def load(val), do: {:ok, val}


  defp reject_blank(collection) do
    Enum.reject(collection, fn(s) -> is_blank(s) end)
  end

  defp is_blank(str) do
    String.length(String.trim(str)) == 0
  end
end
