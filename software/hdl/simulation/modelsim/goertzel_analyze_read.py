import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal



vals=[]
with open('goertzel_analyze_fast.txt','r') as f:
	for val in f:
		if (val[0] in '0123456789abcdef'):
			vals.append(int(val,16))

test=[]
mpl.subplot(2,1,1)
mpl.margins(0.05)
mpl.grid()
mpl.plot(vals)
for step in range(0, len(vals)-250, 250):
	zeros=0
	ones=0
	for step2 in range(249):
		if (vals[step+step2] > 500):
			ones += 1
		else:
			zeros += 1

	if (zeros>ones):
		test.append(0)
	else:
		test.append(1)



mpl.subplot(2,1,2)
mpl.margins(0.05)
mpl.grid()
mpl.plot(test,'o-')


start_of_minute = False
decoded_bits = []
ones=0
zeros=0

for num, val in enumerate(test):

	if (start_of_minute):
		decode_dcf77(decoded_bits)
		decoded_bits = []

	if (val == 1):
		ones += 1
		if (zeros == 1):
			decoded_bits.append(0)
		if (zeros == 2):
			decoded_bits.append(1)
		zeros = 0


	if (val == 0):
		start_of_minute = False
		ones = 0
		zeros += 1


	if ((ones > 10) and not start_of_minute): # detect start of minute indicator
		zeros = 0
		start_of_minute = True
		print('\n')
		print(decoded_bits)
		print("start_of_minute")
		mpl.axvline(num, color='red')



mpl.show()

