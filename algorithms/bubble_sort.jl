##############################
# BUBBLE SORT
##############################

# Get the array from user input
arr = split(readline())

# Sort the array
for i = 1:length(arr), j = 1:(length(arr)-i)
    if arr[j] > arr[j+1]
        arr[j+1], arr[j] = arr[j], arr[j+1]
    end
end

# Print the array
for x in arr
    print(x," ")
end
