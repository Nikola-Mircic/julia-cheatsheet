######################
# Functions
######################

# Basic functions
function func(x, y)
    x + y
end;

println(func(2+3im, 3)) # 5+3im

# Compact "assignment form"
f(x) = 5x + 3

println("$(f(0))") # 3

# Copying functions

function func2(x)
    x*(1+1im)
end

g = f # g(x) = 5x + 3

println("g(0) = $(g(0)), f(0) = $(f(0)), func2(0) = $(func2(0))")

f(x) = func2(x) # g = f = func2 = x*(1+1im)

println("g(0) = $(g(0)), f(0) = $(f(0)), func2(0) = $(func2(0))")

# Argument-type declarations
function exp(x::Integer, n::Integer) # exp(x, n) = x^n
    if n==1
        return x
    end

    temp = exp(x, div(n, 2))

    if n%2==1
        return temp*temp*x
    else
        return temp*temp
    end
end

println(exp(2, 5))

# Anonymous Functions
anonym = x -> (x-5)*x
println(anonym(10))

# Do-block syntax
# do keyword create a function that is passed as the first argument
function need_cb(callback::Function, x, y)
    callback(x^2 + 2*x*y + y^2)
end

need_cb(3, 5) do result
                println(result)
            end

# Function composition and piping
# data |> f1 |> f2 |> ...

function arr_to_string(arr)
    join(arr, " ")
end

function print_arr(arr)
    arr |> arr_to_string |> println
end

print_arr(1:10)

# combination of the chaining/piping and dot vectorization syntax
vec = [1, -4, 9, 16, -25]
vec .|> abs .|> sqrt .|> x->print(x," ")







