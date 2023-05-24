##############################
# INSERTION SORT
##############################

function insert!(arr, i, x)
    for k=i:-1:1
        if arr[k] > x
            arr[[k+1 k]] = arr[[k k+1]]
        else
            break
        end
    end 
end

function insertion_sort!(arr)
    n = length(arr)
    for i=2:n
        insert!(arr, i-1, arr[i])
    end
end

# Get the array from user input
input = map(x->parse(Int, x), split(readline()))

# Sort the array
insertion_sort!(input)

# Print the array
for x in input
    print(x," ")
end

