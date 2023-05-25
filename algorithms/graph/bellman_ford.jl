##############################
# BELLMAN-FORD ALGORITHM
##############################

MAX_INT_VAL = typemax(Int)

function bellman_ford(n::Int, edges::Vector{Tuple{Int, Int, Int}}, start::Int)
    result = ones(Int, n) .* MAX_INT_VAL
    result[start] = 0

    finished = false
    i = 1
    while i<n && !finished
        for (u, w, v) in edges
            if result[u] == MAX_INT_VAL
                continue
            end

            finished = true

            new_dist = result[u] + w
            if new_dist < result[v]
                result[v] = new_dist
                finished = false
            end
        end
        i += 1
    end

    for (u, w, v) in edges
        if result[u] == MAX_INT_VAL
            continue
        end

        new_dist = result[u] + w
        if new_dist < result[v]
            println("Negative circle detected!")
            break
        end
    end

    return result
end

edges = Vector{Tuple{Int, Int, Int}}(undef, 0)

m = parse(Int, readline())

for i=1:m
    input = map(x->parse(Int, x), split(readline()))

    (u, w, v) = (input[1], input[2], input[3])

    push!(edges, (u, w, v))
    #push!(edges, (v, w, u))
end
#
#  1 - 2 - 2
#  | \     |
#  1   5   3
#  |     \ |
#  3 - 3 - 4

#=
5
1  2  2
1  1  3
1  5  4
2  3  4
3  3  4
=#

result = bellman_ford(4, edges, 1)

display(result)