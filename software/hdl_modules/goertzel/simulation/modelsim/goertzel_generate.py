import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import math


# generate samples for  goertzel

# http://www.embedded.com/design/configurable-systems/4024443/The-Goertzel-Algorithm
def goert(samples, sample_rate, freq):

	N = len(samples)

	k=int((N*freq)/sample_rate)
	w = 2.0 * np.pi / N * k
	cosine = np.cos(w)
	coeff = 2 * cosine
	#print("%.90f"% coeff)

	if (freq==77500): coeff = 1.86132676690460430179996365041;

	q0 = 0.0
	q1 = 0.0
	q2 = 0.0
	for n in range(N):
		q0 = coeff * q1 - q2 + samples[n]
		q2 = q1
		q1 = q0

	result = q1**2 + q2**2 - q1*q2*coeff
	result = np.int64(result)
	result >>= 38
	print(result)
	print()
	return result


SAMPLE_RATE = 1300000 #1,3 MHz
WINDOW_SIZE = 5200
t = np.linspace(0, 1, SAMPLE_RATE)[:WINDOW_SIZE]
sine_wave = np.sin(2*np.pi*67000*t+2*np.pi*3.2)

print(max(sine_wave))
print(min(sine_wave))
#sine_wave = awgn(sine_wave, -0)
sine_wave *= 2**16
sine_wave = sine_wave.astype(int)

print (sine_wave)
with open('sine.txt', 'w') as f:
	for i, val in enumerate(sine_wave):
		if ((i >= 1040) and (i<1560)):
			print(i)
			val=int(val/10000)
		if (val < 0):
			val = 2**32-abs(val)
		f.write(hex(val)[2:].zfill(8))
		f.write('\n')

mpl.subplot(2,1,1)
mpl.margins(0.05)
mpl.grid()
plt.plot(sine_wave)
a=[]
for v in range(50000, 100000, 2500):
	print(v)
	a.append(goert(sine_wave, SAMPLE_RATE, v))
mpl.subplot(2,1,2)
mpl.margins(0.05)
mpl.grid()
plt.plot(a,'o')
plt.show()
