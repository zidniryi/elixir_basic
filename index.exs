IO.puts "Hello World"
# Immutable
list = [1,2,4]

IO.inspect list

# Create function
add = fn (n) ->  n + n end

data = add.(2)

IO.inspect data

# Using Values Explicitly
defmodule MySet do
    defstruct items: []
    alias __MODULE__ # <- this is the magic
    
    def push(set = %{items: items}, item) do
        if Enum.member?(items, item) do
            set
        else
            %{set | items: items ++ [item]}
        end
    end
end

defmodule User do
  defstruct name: "John", age: 27
end


defmodule Greeter do
    def hello(name) do
        IO.inspect(name)
    end
end

# Function Transforming Values pipe operator
defmodule Transforming do
    def capitalize_word(title) do
        title
        |> String.split(" ")
        |> Enum.map(&String.capitalize/1)
        |> Enum.join(" ")
    end
end

# Main
defmodule Main do
  def main do
    john = %User{}
    set = %MySet{}
    set = MySet.push(set, "apple")
    IO.puts(john.name)
    IO.puts(john.age)
    # Like Class
    IO.inspect MySet.push(set, "Banana")
    Greeter.hello("Zidniryi123")
    IO.inspect Transforming.capitalize_word("kill the dragon")
  end
end


Main.main