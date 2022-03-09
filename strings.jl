######################
# Characters
######################

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