##############################
# Heap
##############################

module HeapModule
    mutable struct Heap{T}
        max_size::Int64
        size::Int64
        data::Vector{T}
        comp::Function
    end

    # Display control
    Base.show(io::IO, h::Heap) = print(io, "Heap [$(h.size)]")

    # Create an empty list
    function create_heap(::Type{T}, size, comp=<) where {T}
        heap = Heap(size, 0, Vector{T}(undef, size), comp)
        return heap
    end
    function create_heap(arr::Array{T}, comp=<) where {T}
        heap = Heap(length(arr), 0, Vector{T}(undef, length(arr)), comp)
        for x in arr
            add(heap, x)
        end

        return heap
    end

    export create_heap

    function parenet(x)
        p = div(x,2)

        return (p==0) ? x : p
    end

    function add(heap::Heap, x)
        if heap.size < heap.max_size
            heap.size += 1
            heap.data[heap.size] = x

            p = heap.size
            cmp = heap.comp
            while cmp(heap.data[p], heap.data[parenet(p)])
                heap.data[[p parenet(p)]] = heap.data[[parenet(p) p]]
                p = parenet(p)
            end
        else
            println("Maximum heap size reached!")
        end
    end

    export add

    function first(heap::Heap)
        return heap.data[1]
    end

    export first

    function pop(heap::Heap)
        t = heap.data[1]

        heap.data[1] = heap.data[heap.size] 

        heap.size -= 1

        heapify(heap)
        return t
    end

    export pop
    
    heapify(heap::Heap) = heapify(heap.data, heap.size, 1, heap.comp)

    function heapify(a::Array, n::Int, idx::Int, cp::Function)
        l = idx*2
        r = idx*2+1
        max = idx
    
        if l<=n && cp(a[l], a[max])
            max = l
        end
        if r<=n && cp(a[r], a[max])
            max = r
        end
    
        if max != idx
            a[[max idx]] = a[[idx max]]
            
            heapify(a, n, max, cp)
        end
    end
end;
