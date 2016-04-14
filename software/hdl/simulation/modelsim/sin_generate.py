import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import math


# generate samples


SAMPLE_RATE = 1300000 #1,3 MHz
WINDOW_SIZE = 1300
t = np.linspace(0, 1, SAMPLE_RATE)[:WINDOW_SIZE]
sine_wave = np.sin(2*np.pi*775000*t+2*np.pi)

print(max(sine_wave))
print(min(sine_wave))
#sine_wave = awgn(sine_wave, -0)
sine_wave *= 2**15
sine_wave *= 0.999
sine_wave = sine_wave.astype(int)
print(max(sine_wave))
print(min(sine_wave))

with open('sine.txt', 'w') as f:
	for i, val in enumerate(sine_wave):
		if ((i >= 2600) and (i<3900)):
			val=int(val/8)
		if (val < 0):
			val = 2**16-abs(val)
		f.write(hex(val)[2:].zfill(4))
		f.write('\n')

mpl.plot(sine_wave, 'o-')
mpl.show()

