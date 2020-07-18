from z3 import *

a = Int('a')	# qword_602148
b = Int('b')	# qword_602150
c = Int('c')	# qword_602158
d = Int('d')	# qword_602160

s = Solver()
s.add(-24 * a + (-18 * b) + (-15 * c) + (-12 * d) == -18393)
s.add(9 * c + 18 * (b + a) + -9 * d == 4419)
s.add( 4 * c + 16 * a + 12 * b + 2 * d == 7300)
s.add(-6 * (b + a) + -3 * c+ -11 * d == -8613)
print(s.check())
print(s.model())