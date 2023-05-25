##############################
# LINKED LIST
##############################

module LinkedListModule
    # Node struct
    mutable struct Node{T}
        val::T
        prev::Union{Node{T},Nothing}
        next::Union{Node{T},Nothing}

        # Default constructor
        Node(v::T) where {T} = new{T}(v, nothing, nothing)
    end

    mutable struct LinkedList
        head::Node
        tail::Node
        length::Int64
    end

    # Display control
    Base.show(io::IO, n::Node) = print(io, "Node {$(n.val)}")
    Base.show(io::IO, ll::LinkedList) = print(io, "Linked list [$(ll.length)]")

    # Create an empty list
    function create_list()
        list = LinkedList(Node(0), Node(0), 0)
        list.head.next = list.tail
        return list
    end

    export create_list

    function print_list(list)
        t = list.head

        t = t.next
        
        while t !== nothing
            print("$(t.val) ")
            t = t.next
        end
    end

    export print_list

    function add(list, x)
        t = Node(x)
        if list.length == 0
            list.head.next = t
            list.tail = t
            t.prev = list.head
        else
            t.prev = list.tail
            list.tail.next = t
            list.tail = t 
        end
        list.length += 1
    end

    export add

    function find(list, x)
        t = list.head

        t = t.next
        
        while t !== nothing
            if t.val === x
                return t
            end

            t = t.next
        end

        return nothing
    end

    export find

    function get(list, idx)
        t = list.head.next

        while idx>1
            t = t.next
            idx -= 1
        end

        return (idx<0) ? nothing : t.val
    end

    export get

    function head(list)
        return list.head.val
    end

    export head

    function tail(list)
        return list.tail.val
    end

    export tail

    function remove(list, x)
        t = find(list, x)

        prev = t.prev
        prev.next = t.next
        if t.next !== nothing
            t.next.prev = prev
        end
    end

    export remove

    function empty(list)
        list.head.next = nothing
    end

    export empty
end;
