##############################
# COUNTING SORT
##############################

function CountingSort(a::Array{Int})
    top = maximum(a)
    bot = minimum(a)

    n = top-bot+1

    c = zeros(Int, n)

    b = Array{Int, 1}(undef, length(a))

    for x in a
        c[x-bot+1] += 1
    end

    for i in 2:length(c)
        c[i] = c[i] + c[i-1]
    end

    for i in length(a):-1:1
        b[c[a[i]-bot+1]] = a[i]
        c[a[i]-bot+1] -=1
    end

    return b
end

# Get the array from user input
input = map(x->parse(Int, x), split(readline()))

# Sort the array
insertion_sort!(input)

# Print the array
for x in input
    print(x," ")
end

