##############################
# SELECTION SORT
##############################

function selection_sort(arr)
    for i = 1:length(arr), j = i:length(arr)
        if arr[j] < arr[i]
            arr[i], arr[j] = arr[j], arr[i]
        end
    end
end

# Get the array from user input
input = map(x->parse(Int, x), split(readline()))

# Sort the array
selection_sort(input)

# Print the array
for x in input
    print(x," ")
end