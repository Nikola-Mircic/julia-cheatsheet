######################
# BASIC VARIABLES
######################

# Variable definition
x = 5
y = "3"
a,b = 3, 5
println(x," ", y," ", a," ", b) # 5 3 3 5

# Double a variable
x = 2x
println(x) # 10

# Make it exponential
x = x^2
println(x) # 100

# Array definition
arr = [1, 2, 3, 4]
println(arr) # [1, 2, 3, 4]

# Dot "." operator
arr .= arr.^2
println(arr) # [1, 4, 9, 16]

# @. macro
@. arr=arr^2
println(arr) # [1, 16, 81, 256]

# Double arr
arr = 2arr # or arr.*2
println(arr) # [2, 32, 162, 512]

# NaN
nan = NaN
println(nan == NaN) # false

######################
# COMPLEX NUMBERS
######################

# Complex number
c1 = 3+2im
c2 = 3-2im
println(c1 * c2) # 13 + 0im

# Adding real and complex number
println(x + c1) # 103+2im

# Adding complex and complex number
println(c2 + 3im) # 3+1im

# Real part
println(real(c1)) # 3

# Imaginary part
println(imag(c2)) # -2

# Complex conjugate
println(conj(c1) == c2) # true

######################
# RATIONAL NUMBERS
######################

# Define rational number
r1 = 4//5
println(r1) # 4//5

# If the numerator and denominator of a rational have common factors,
# they are reduced to lowest terms such that the denominator is non-negative

r2 = 4//8
println(r2) # 1//2

println(r1 == 8//10) # true