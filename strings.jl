######################
# Characters
######################
#=
# Basic characters
c1 = 'b'

println(c1) # b
println(Int(c1)) # 98

# Char from int
c2 = Char(97)

println(c2) # a
println(Int(c2)) # 97

c3 = c1+1 # 'b' + 1 = 'c'
println(c3 == 'c') # true

println(c2 < c1) # true

# Char from hexadecimal number ( 0x..., '\u...', '\U...')
# \u is followed by up to four hexadecimal digits
# \U is followed by up to eight hexadecimal digits
hex_c1 = Char(0x63)
hex_c2 = Char('\u64')
hex_c3 = '\U101234'

println(hex_c1) # c
println(hex_c2) # d
println(hex_c3) # 􁈴
println(Int(hex_c1)) # 99
println(Int(hex_c2)) # 100
println(Int(hex_c3)) # 1053236
=#
######################
# Strings
######################

# Basic string
str = "This is a string. \n"
println(str)

# Breaking up a string
broken_str = "This is a \
             broken string"
println(broken_str) # This is a broken string

# Strings with quotes
quote_str1 = """This string contains "quotes". \n""" # """ + str + """ 
quote_str2 = "This string contains \"quotes\" also. \n" # str + \" + str
println(quote_str1) # This string contains "quotes". 
println(quote_str2) # This string contains "quotes" also.  

# Accessing string
first_char = str[begin]
println(first_char) # T

first_char = str[1] # INDEX STARTS AT 1
println(first_char) # T

last_char = str[end]
println(last_char) # \n

middle_char = str[div(end,2)] # div(x,y) -> truncated division
println(middle_char) # a

this_part = str[1:4]
println(this_part) # This

# String indices in Julia refer to code units (= bytes for UTF-8),
# the fixed-width building blocks that are used to encode arbitrary characters (code points).
# This means that not every index into a String is necessarily a valid index for a character.

big_chars = "\u2200 x \u2203 Y"
println(big_chars) # ∀ x E y

for i = firstindex(big_chars):lastindex(big_chars)
    try
        println("str[",i,"] : ",big_chars[i])
    catch
        println("str[",i,"] is a part of the previous character")
    end
end

# To avoid indexing problems in string with large characters
for char in big_chars
    print(char)
end
println() # ∀ x ∃ Y

# List of falid indices
valid_indices = eachindex(big_chars)

for idx in valid_indices
    print(big_chars[idx])
end
println() # ∀ x ∃ Y

# Concatenation
str1 = "string 1"
str2 = "string 2"

concat_str = string("1: ",str1, " ", str2)
println(concat_str)

concat_str = "2: " * str1 * " " * str2
println(concat_str)

# Interpolation ( $ )

# for concatenation
concat_str = "$str1 $str2"
println(concat_str)

# With expressions
exp = "(3 + 4) * (5 - 2) = $((3 - 4) * (5 - 2))"
println(exp)

# With arrays
arr = [1, -4, 3, 5]
println("Array : $arr")

# Strings are comparable
abc = "abc"
println(abc < "abd") # true
println(abc == "abc") # true

# findfirst(), findlast(), findnext() and findprev()
word = "xylophone"
first_o = findfirst(isequal('o'), word)
last_o = findlast(isequal('o'), word)

first_after_5 = findnext(isequal('o'), word, 5);
first_before_5 = findprev(isequal('o'), word, 5);

println("First o at: $first_o")
println("Second o at: $last_o")
println("There is o at $first_before_5 and $first_after_5")

# Check if the string contains another string or char
println(occursin("phon", "xylophon")) # true
println(occursin('a', "xylophon")) # false