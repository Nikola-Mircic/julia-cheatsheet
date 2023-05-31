##############################
# GRAPH - ADJACENCY MATRIX
##############################

module GraphModule
    MAX_INT_VAL = typemax(Int)

    mutable struct Graph{T}
        v::Int # Number of vertices
        matrix::Matrix{Int} # Adjacency matrix
        nodes::Vector{T}
    end
    
    # Display control
    Base.show(io::IO, g::Graph) = print(io, "Graph [$(g.v)]")

    # Create an empty graph
    function create_graph(::Type{T}, n::Int) where {T}
        matrix = ones(Int, n, n) .* MAX_INT_VAL
        nodes = Vector{T}(undef, 0)

        return Graph{T}(0, matrix, nodes)
    end

    export create_graph

    function resize_matrix!(G::Graph)
        (n, n) = size(G.matrix)
        new_n = 2*n

        G.matrix = G.matrix .- MAX_INT_VAL

        return ones(Int, new_n, new_n) + G.matrix
    end

    function add_node!(::Type{T}, G::Graph, x::T) where {T}
        G.v += 1
        push!(G.nodes, x)

        (n,n) = size(G.matrix)

        if G.v > n
            resize_matrix!(G)
        end
    end
    
    export add_node!

    function add_edge!(::Type{T}, G::Graph, x::T, y::T, w::Int) where {T}
        idx_x = findfirst(a->a==x, G.nodes)
        idx_y = findfirst(a->a==y, G.nodes)

        G.matrix[idx_x, idx_y] = w
    end

    export add_edge!

    function print_graph(G::Graph)
        for i=1:G.v
            println("$(i) - $(G.nodes[i])")
        end

        for i=1:G.v
            print("$(i): ")

            for j=1:G.v
                print("$(G.matrix[i, j]) ")
            end

            println()

        end
    end

    export print_graph

    function neighbours(G::Graph, x)
        idx_x = findfirst(a->a==x, G.nodes)
        return findall(G.matrix[idx_x, :] .!= MAX_INT_VAL)
    end

    export neighbours
end;