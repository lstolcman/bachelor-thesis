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
	print("%.90f"% coeff)
	coeff = 1.86132676690460430179996365041;
	print("%.90f"% coeff)

	q0 = 0.0
	q1 = 0.0
	q2 = 0.0
	f = open('debug.txt', 'w')
	for num, n in enumerate(range(N)):
		q0 = coeff * q1 - q2 + samples[n]
		q2 = q1
		q1 = q0
		f.write(str(num)+' ' + str(num+6)+'\n')
		f.write('sample = ' + str(samples[n]) + '\n')
		f.write('q0 = ' + str(q0) + '\n')
		f.write('q1 = ' + str(q1) + '\n')
		f.write('q2 = ' + str(q2) + '\n\n')

	result = q1**2 + q2**2 - q1*q2*coeff
	f.write('result:' + str(result))
	f.close()
	return result


SAMPLE_RATE = 1300000 #1,3 MHz
WINDOW_SIZE = 520
t = np.linspace(0, 1, SAMPLE_RATE)[:WINDOW_SIZE]
sine_wave = np.sin(2*np.pi*77500*t+2*np.pi*3.2)

print(max(sine_wave))
print(min(sine_wave))
#sine_wave = awgn(sine_wave, -0)
sine_wave *= 2**16
sine_wave = sine_wave.astype(int)

print (sine_wave)

goert(sine_wave, SAMPLE_RATE, 77500)

