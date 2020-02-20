do wave.do

run 20000

#undefined opcode
#should output XX
force in_a     16#00
force in_b     16#00
force opcode 16#00
run 20000

# add opcode
# should output 00
force in_a     16#00
force in_b     16#00
force opcode 16#01
run 20000

# add opcode
# should output 20
force in_a     16#10
force in_b     16#10
force opcode 16#01
run 20000

# add opcode
# Should output 1E0
#should cause a carry
force in_a     16#F0
force in_b     16#F0
force opcode 16#01
run 20000


# add opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#01
run 20000

# sub opcode
# should output 00
force in_a     16#00
force in_b     16#00
force opcode 16#02
run 20000

# sub opcode
# should output 0B
force in_a     16#10
force in_b     16#05
force opcode 16#02
run 20000

# sub add opcode
#should cause a carry
force in_a     16#05
force in_b     16#10
force opcode 16#02
run 20000

# sub opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#02
run 20000

# inc opcode
# should output 06
force in_a     16#05
force in_b     16#XX
force opcode 16#03
run 20000


# inc opcode
# should output 00 with carry
force in_a     16#FF
force in_b     16#XX
force opcode 16#03
run 20000


# inc opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#03
run 20000


# dec opcode
# should output 04
force in_a     16#05
force in_b     16#XX
force opcode 16#04
run 20000


# dec opcode 
# should output FF with carry
force in_a     16#00
force in_b     16#XX
force opcode 16#04
run 20000


# dec opcode
#should output 00 with zero=1
force in_a     16#01
force in_b     16#XX
force opcode 16#04
run 20000


# dec opcode
# should output 20
force in_a     16#XX
force in_b     16#XX
force opcode 16#04
run 20000


# or opcode
#should cause output of FF
force in_a     16#a5
force in_b     16#5a
force opcode 16#05
run 20000



# or opcode
# should output 00
force in_a     16#00
force in_b     16#00
force opcode 16#05
run 20000


# or opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#05
run 20000



# and opcode
#should cause output of 00
#should assert zero
force in_a     16#F0
force in_b     16#0F
force opcode 16#06
run 20000


# and opcode
# should output FF
force in_a     16#FF
force in_b     16#FF
force opcode 16#06
run 20000


# and opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#06
run 20000


# xor opcode
#should cause output of F0
force in_a     16#aF
force in_b     16#5F
force opcode 16#07
run 20000


# xor opcode
#should output FF
force in_a     16#FF
force in_b     16#00
force opcode 16#07
run 20000


# xor opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#07
run 20000


# shr opcode
#should cause output of 1E
force in_a     16#3C
force in_b     16#XX
force opcode 16#08
run 20000


# shr opcode
#should output 00 with zero=1
force in_a     16#01
force in_b     16#XX
force opcode 16#08
run 20000


# shr opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#08
run 20000


# shl opcode
#should cause output of 68
force in_a     16#5A
force in_b     16#XX
force opcode 16#09
run 20000


# shl opcode
#should output 00 with zero=0
force in_a     16#80
force in_b     16#XX
force opcode 16#09
run 20000


# shl opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#09
run 20000


# onescomp  opcode
#should cause output of AF
force in_a     16#50
force in_b     16#XX
force opcode 16#0A
run 20000


# onescomp opcode
# should output 00
force in_a     16#FF
force in_b     16#XX
force opcode 16#0A
run 20000


# onescomp opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#0A
run 20000


# twoscomp  opcode
#should cause output of FB
force in_a     16#05
force in_b     16#XX
force opcode 16#0B
run 20000


# twoscomp opcode
#should output 00 with carry=1
force in_a     16#00
force in_b     16#XX
force opcode 16#0B
run 20000


# add opcode
# should output 0
force in_a     16#XX
force in_b     16#XX
force opcode 16#0B
run 20000



