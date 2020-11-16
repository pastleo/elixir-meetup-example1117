defmodule Example1117 do
  def cat(filename) do
    {:ok, content} = File.read(filename)
    IO.puts(content)
  end

  def show_json_post(filename) do
    with {:ok, content} <- File.read(filename),
         {:ok, json} <- Jason.decode(content)
    do
      json
      |> Enum.random()
      |> show_post()
    else
      {:error, :enoent} ->
        IO.puts("no such file #{filename}")
        :error
      err ->
        IO.inspect(err)
        :error
    end
  end

  def show_post(%{ "author" => author, "title" => title }) do
    IO.puts("#{title}\n\tby #{author}")
  end
  def show_post(_) do
    IO.puts("not valid post json")
    :error
  end

  def hello do
    :world
  end
end
