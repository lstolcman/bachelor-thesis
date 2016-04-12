import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import math


# compare python and modelsim results

# http://www.embedded.com/design/configurable-systems/4024443/The-Goertzel-Algorithm
def goert(samples, sample_rate, freq):

	N = len(samples)

	k=int((N*freq)/sample_rate)
	w = 2.0 * np.pi / N * k
	cosine = np.cos(w)
	coeff = 2 * cosine
	print("%.30f"% coeff)

	q1 = 0
	q2 = 0
	for n in range(N):
		q0 = coeff * q1 - q2 + samples[n]
		q2 = q1
		q1 = q0

	result = q1**2 + q2**2 - q1*q2*coeff
	return result


SAMPLE_RATE = 130000000
WINDOW_SIZE = 52000
t = np.linspace(0, 1, SAMPLE_RATE)[:WINDOW_SIZE]
sine_wave = np.sin(2*np.pi*77500*t)

print(max(sine_wave))
print(min(sine_wave))
#sine_wave = awgn(sine_wave, -0)
sine_wave *= 2**8
sine_wave = sine_wave.astype(int)


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
