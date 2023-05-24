##############################
# BUBBLE SORT
##############################

function bubble_sort(arr)
    for i = 1:length(arr), j = 1:(length(arr)-i)
        if arr[j] > arr[j+1]
            arr[j+1], arr[j] = arr[j], arr[j+1]
        end
    end
end

# Get the array from user input
input = map(x->parse(Int, x), split(readline()))

# Sort the array
bubble_sort(input)

# Print the array
for x in input
    print(x," ")
end
