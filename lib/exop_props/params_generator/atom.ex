defmodule ExopProps.ParamsGenerator.Atom do
  @moduledoc """
  Implements ExopProps generators behaviour for `atom` parameter type.
  """

  alias ExopProps.CommonGenerators

  @behaviour ExopProps.ParamsGenerator.Generator

  def generate(opts \\ %{}) do
    # TODO: implement :alias option
    opts |> Map.get(:length) |> do_generate()
  end

  defp do_generate(%{is: length}), do: with_opts(length: length)

  defp do_generate(%{in: range}) do
    with_opts(length: range)
  end

  defp do_generate(%{min: min, max: max}) do
    do_generate(%{in: min..max})
  end

  defp do_generate(%{min: min}) do
    with_opts(min_length: min)
  end

  defp do_generate(%{max: max}) do
    with_opts(max_length: max)
  end

  defp do_generate(_), do: CommonGenerators.atom()

  defp with_opts(opts) do
    CommonGenerators.atom(opts)
  end
end
