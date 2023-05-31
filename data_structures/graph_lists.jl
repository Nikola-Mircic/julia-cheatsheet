##############################
# GRAPH - ADJACENCY LISTS
##############################

module GraphModule
    mutable struct Graph{T}
        v::Int # Number of vertices
        lists::Vector{Vector{Tuple{Int, T}}} # Adjacency lists
        nodes::Dict{T, Int} # Dict for mapping each node to the corresponding index
    end
    
    # Display control
    Base.show(io::IO, g::Graph) = print(io, "Graph [$(g.v)]")

    # Create an empty graph
    function create_graph(::Type{T}) where {T}
        lists = Vector{Vector{Tuple{Int, T}}}(undef, 0)

        return Graph{T}(0, lists, Dict{T, Int}())
    end

    export create_graph

    function add_node!(::Type{T}, G::Graph, x::T) where {T}
        G.v += 1
        G.nodes[x] = G.v
        push!(G.lists, Vector{Tuple{Int, T}}(undef, 0))
    end
    
    export add_node!

    function add_edge!(::Type{T}, G::Graph, x::T, y::T, w::Int) where {T}
        idx_x = G.nodes[x]

        push!(G.lists[idx_x], (w, y))
    end

    export add_edge!

    function print_graph(G::Graph)
        for (node, idx) in G.nodes
            println("$(node) - $(idx)")
        end

        for i in eachindex(G.lists)
            print("$(i): ")

            for (w, y) in G.lists[i]
                print("$(y)[$(w)] ")
            end

            println()

        end
    end

    export print_graph

    function neighbours(G::Graph, x)
        return G.lists[G.nodes[x]]
    end

    export neighbours
end;