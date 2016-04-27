import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal









vals=[]
with open('goertzel_analyze_fast.txt','r') as f:
	for val in f:
		if (val[0] != '/' and val[0] in '0123456789abcdef'):
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
		if (step > 179000):
			print(len(vals),step, step2, step+step2, vals[step+step2])
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





mpl.show()

