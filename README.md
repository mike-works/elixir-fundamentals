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