# Elixir Fundamentals Workshop

Attending Rails to Elixir & Phoenix workshop with Michael North @mike-north in Berlin, Germany 2017/4/24 - 2017/4/26.

Workshop details: https://elixir-phoenix-workshop.simplabs.com/

## Phoenix and Elixir
The Phoenix Framework allows developers to build robust, performant and scalable web applications faster than ever. By combining Elixir's modern language syntax and tried-and tested foundation, with many of the productivity benefits that made Ruby on Rails astonishingly popular, this new web framework promises to be great (dare I say, ideal?) option for a variety of projects.


## Installation
Github repo: https://github.com/mike-north/elixir-fundamentals-workshop

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_fundamentals` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:elixir_fundamentals, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can be found at [https://hexdocs.pm/elixir_fundamentals](https://hexdocs.pm/elixir_fundamentals).

## Erlang ecosystem
Erlang is a tried and tested language for over 30 years! Therefore, Elixir benefits from Erlang's rich ecosystem with a wealth of libraries, all with modern language features.  Elixir has taken a lot of Ruby's strength and improved on the weakness, making it fun to write with minimal syntax. 

Learn more here: https://www.erlang.org/

Elixir is a functional language, centered on building scalable products over academic curiosity.

## Data Structures
In Elixir, data structures are grouped into two categories:

### Types of Values
* Integers
* Floats
* Atoms
Similar to ```symbols``` in Ruby, Atoms are constants and globally stored. Often used in key:value pairs as the key. Atoms do take up memory and held on to for the entire lifecycle of your app, so use them with caution.

Example: 
``` :first_name ```

* Ranges
Example: 
``` [4..10]   #[4,5,6,7,8,9,10]
```

### Types of Collections
* Tuples
Ordered sets of values and widely used in pattern matching, Tuples behaves similarly as Javscript objects or Ruby hashes. 
Tuples are typically <= 5 elements in Elixir best practice.

Example:
``` 
{:first_name, "Mike"}
{:ok, status} = {:ok, "Success!"} 
status  # "Success!"
```

* Lists
Elixir lists are Linked Lists, which store ordered collection of values. Best practice prefer recursion over iteration of list elements (no For Loops!)

Example:
```
[1,2,3] ++ [5,6]   #[1,2,3,5,6]
```

* Maps
Maps are also key-value data structures, and are more performant than Lists. 
Keys must be unique!

Example:
```
person = %{
  name: "Lisa",
  skills: "coding"
}
```

Maps can be nested too! As data structures are immutable, if you update or add new key:values into a map, you will create a new copy of the Map applied to.

Example:
```
instructor = %{
  name: "Mike North",
  location: %{
    country: "Germany",
    city: "Berlin"
  }
}
```

* Binaries
Ordered collection for raw binary data. F

Example:
```
red_RGB = <<255, 0, 0>>
```

* Strings
Elixir treats double-quote string ```"str"``` as a binary, versus single-quote ```'str'``` as a string.
Elixir has a ```spaceship <>``` operation for concatenation.

Example:
```
"Learning " <> "Elixir"
```

To create multi-line strings, use three double-quotes - this is known as ```Heredocs```.

Example:
```
def bar() do
  str = """
  Elixir is
  1. Functional
  2. Fun to write!
  """
end

bar()   # "Elixir is\n1. Functional\n2. Fun to write!"
```

## Functions and Modules

### Anonymous Functions
An anonymous function begins with ```fn``` and end with ```end```. Invoke function using ```.()``` passing arguments

Example:
```
square = fn x -> x * x end

square.(12)   #144
```

Functions can have multiple clauses, each designed to handle a scenario. This is a similar concept to Javascript Case Switch control flow.

When compiled, the BEAM virtual machine will check through each clause from top to bottom, and execute the first clause which matches pattern passed in.

Example:
```
calculate = fn
  {:add, a, b} -> a * b
  {:multiply, a, b} -> a * b
  _                 -> "No calculation!"
end

calculate.({:add, 3, 7})   #10
```

### Guards
In functions, we can define conditions to check as clauses are evaluated. Guards can be used to control flow of clauses.

[Elixir Reference Link](http://elixir-lang.org/getting-started/case-cond-and-if.html#expressions-in-guard-clauses)

Example:
```
enter_bar = fn
  age when age <21 -> "Sorry, no entry."
  _                 -> "Come on in!"
end

ender_bar.(40)    # "Come on in!"
```

### Higher order functions
HO functions take a function as an argument and returns a function. The scope defined is similar to Javascript's Closure concept.

Example:
```
add = fn x ->
  fn y -> x + y end
end

add.(3)(5)   # 8
```

### Functions Shorthand Notation
We can define short helper functions inline with ```&()``` , these are handy if you are creating simple, single-purpose functions.

Example:
```
currency_maker = &("$#{&1}")

currency_maker.(150)   #  $150
```

In shorthand notations, we can further select ordered arguments using ```&1, &2``` etc. 

Example:
```
time_format = &("#{&1}:#{&2}")

time_format.(9, 45)   # "9:45"
```

### Modules
Modules are named functions, in which you can define multiple functions. Within the scope of each module, you can define Private Functions that are only accessible within the parent module.

Best practice is to define more specific function clauses first when the clauses have the same name.

Example:
```
defmodule Formatter do
  def money(%{amount: amt}) do
     money(amt)
  end
  def money(x), do : "$#{x}"

  defp log(x), do: &IO.puts(&1)
end

Formatter.money(100)  #  $100
```

### Default Values in Functions
Function arguments can specify default values with ```\\``` symbol.  In Elixir, not all arguments have to have default values!

Example:
```
defmodule Formatter do
  def money(x, symbol \\ "$"), do: "#{symbol}#{x}"
end

Formatter.money(100)    #  $100
Formatter.money(100, "€")    # "€100"
```

## Pipe-forward operator |>
In Elixir, you can use the pipe-forward operator ```\>``` to sequentially operate on a value passed into a function as an argument.  This is a powerful concept, reducing repeition and writing D.R.Y code.

Example
```
star_wars = MapSet.new
star_wars = MapSet.put(star_wars, "A New Hope")
star_wars = MapSet.put(star_wars, "The Empire Strikes Back")
star_wars = MapSet.put(star_wars, "Return of the Jedi")

star_wars   # ["A New Hope", "The Empire Strikes Back", "Return of the Jedi"]
```

Let's use the pipe-forward symbole ```\>``` :
```
star_wars = MapSet.new
|> MapSet.put(star_wars, "A New Hope")
|> MapSet.put(star_wars, "The Empire Strikes Back")
|> MapSet.put(star_wars, "Return of the Jedi")

star_wars   # ["A New Hope", "The Empire Strikes Back", "Return of the Jedi"]
```

## Module Directives: import
Using the ```import``` directive, you can include another module's (named function) public functions/macros into the scope of any module. You can also use it to cut down on fully-namespaces calls.

Example:
```
defmodule Calculator do
  def add(items) do
    import IO, only: [puts: 1]
    puts "Adding !#Enum.count(items)} things"
    Enum.sum(items)
  end
end
```

## Module Directives: alias
Alias is handy as shorthand references for complex, deeply nested modules. You should define alias in the top of the body of your module, and by default "aliased" name is the last part of the module name. Alternatively, you can map to a new name with ```as: ```

Example:
```
defmodule Calculator do
  alias MyApp.Models.User, as: U;
  def register(data) do
    data
    |> U.process_registration
  end
end
```

## Module Directives: attributes @
Attributes is defined with the ```@``` symbol. They are often used to keep track of environment variables, such as ```Application.get_env(:my_app, :github_key)``` . This concept is similar to Ruby's ```constants``` , where it is immutable and cannot be set from within module functions.

Example:
```
defmodule GithubApi do
  @api_key Application.get_env(:my_app, :github_key)
  defp key do
    @api_key
  end
end
```

## Data structure: Struct
Structs are special flavors of Map, where you can define properties and enable pattern matching by type.

Example:
```
defmodule MobileApp do
  defstruct name: "", platforms: ["ios"]
  def download_url(%MobileApp{name: app_name, platforms: ["ios"]}) do
    "https:!/dl.apple.com?name=!#app_name}"
  end
end
```