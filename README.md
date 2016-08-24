MLG’s repo: <https://github.com/mlg-/bug-squishing>

---

READ THE STACK TRACE

* Look carefully at file path and line number where things are erroring out
* What’s the method where the problem is occuring?
* What is the actual Error type?

---

Some common Ruby errors:

`NameError`: You're trying to call something that is spelled wrong or plain old doesn't exist. Did you forget to capitalize your class name? Did you misspell the name of the method you actually want? (`AnotherClass.new`)

`NoMethod`: You're trying to call a method that isn't available or doesn't exist for the given variable. Usually this is because you think your variable is a string or an integer or an array...but it's actually `nil`. Nil has very few methods available to it, compared to most other ruby data types. (`kittens.non_existent_method`)

`LoadError`: You're trying to call a file from the wrong place. Or it doesn't exist yet. Or it's in a different folder than you think it is. Or you misspelled its name. (`require_relative' 'bloop'`)

`ArgumentError`: You're trying to give a method too many arguments...or too few. Check out the numbers to help clear things up: `(0 for 1)` means one argument is required and you aren't passing it. `(2 for 1)` means you're passing two and it only takes one! (`SomeClass.new("bloop")`)

'TypeError': You're trying to do something with an integer that you can only do with a string. Or any other data type mismatch. i.e.: `[1, 2, 3].first("two")`. (`s.some_method`)

`SystemStackError`: "Stack level too deep!" This almost always happens when you have an unterminated `while` loop, a method that calls itself without conclusion, or other structure that keeps going indefinitely. Your system runs out of space and you get a "[stack overflow](https://en.wikipedia.org/wiki/Stack_overflow)." (`infinite_loop`)


---

### Time to Pry

* Let’s open up a pry sesion!

```ruby
[{"name" => "Maggie"}, {"name" => "Paddy"}]
a = _
paddy = a.select{|student| student["name"] == "Paddy"}
paddy["name"]
=> TypeError: no implicit conversion of String into Integer
# we assumed paddy would be a hash we could access with the key "name", but actually Paddy is an array.  Arrays have indeces, so it expected ["name"] to be an integer, but it's a string, which caused the above error
```

---

### Time to Duckboat!

Step 1: LoadError

```ruby
rspec
# analyze the stack trace! We have a LoadError we need to fix
```

Step 2: Undefined method for class

```ruby
rspec
# let's throw a pry into Boat module and run our failing test
# it's never hit

# let's throw a pry into the test that's failing above the expect statement
Duckboat.included_modules
Duckboat.included_modules.include?(Boat)
Duckboat.included_modules.include?(Water_fowl)
```

Step 3: running the method but unexpected return value, Inheritance Tree

For some reason including Boat broke a previously passing test, throw prys into both modules and see which one is hit

Step 4: undefined method `some\_method' for nil:NilClass

vs. in step 2 where the method error was for the correct class, Nil has very few methods. We probably made some wrong assumption and was expecting a certain object type but instead got nil, let’s throw a pry before the expect statement

```ruby
new_boat
new_boat.captain
new_boat.captain.name # reproduces the error
new_boat.captain = Passenger.new("Nick")
new_boat.captain
new_boat.captain.name
# exit and watch the test pass
rspec
# now watch the test fail
```

---

### Pry Tips

Find a Class’s instance methods

```ruby
Array.instance_methods
```

Find a Class’s instance methods specific to the class (ie not from inheritance) docs: [http://apidock.com/ruby/Module/instance\_methods](http://apidock.com/ruby/Module/instance_methods)

```ruby
Array.instance_methods(false)
```

Find an objects methods

```ruby
x = "hello"
x.methods
```

Find modules included in a class

```ruby
Array.included_modules
```
