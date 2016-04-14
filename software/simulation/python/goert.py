import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal





def awgn(input_signal, snr_dB, rate=1.0):
	"""
	Addditive White Gaussian Noise (AWGN) Channel.
	Parameters
	----------
	input_signal : 1D ndarray of floats
		Input signal to the channel.
	snr_dB : float
		Output SNR required in dB.
	rate : float
		Rate of the a FEC code used if any, otherwise 1.
	Returns
	-------
	output_signal : 1D ndarray of floats
		Output signal from the channel with the specified SNR.
	"""

	avg_energy = sum(input_signal * input_signal)/len(input_signal)
	snr_linear = 10**(snr_dB/10.0)
	noise_variance = avg_energy/(2*rate*snr_linear)

	if input_signal.dtype is complex:
		noise = (sqrt(noise_variance) * np.random.randn(len(input_signal))) + (np.sqrt(noise_variance) * np.random.randn(len(input_signal))*1j)
	else:
		noise = np.sqrt(2*noise_variance) * np.random.randn(len(input_signal))

	output_signal = input_signal + noise

	return output_signal


'''
s01 = 0.25*np.sin(2*np.pi*77.5*np.arange(0, .1, 1.0/1024))
s02 = 0.25*np.sin(2*np.pi*77.5*np.arange(0, .2, 1.0/1024))
s08 = np.sin(2*np.pi*77.5*np.arange(0, .8, 1.0/1024))
s09 = np.sin(2*np.pi*77.5*np.arange(0, .9, 1.0/1024))
s1 = np.sin(2*np.pi*77.5*np.arange(0, 1, 1.0/1024))

s = np.append(s1.copy(), s01.copy())
s = np.append(s, s09.copy())

plt.subplot(5,2,1)
plt.margins(0.05)
plt.grid()
plt.plot(s)


plt.subplot(5,2,2)
plt.margins(0.05)
mpl.xticks(range(0, int(len(s)/2), int(1024/64)), range(0, 512, 8), rotation=90)
plt.xlabel('Frequency [Hz]')
plt.grid()
plt.plot(abs(np.fft.fft(s))[:len(s)/2])



plt.subplot(5,2,3)
plt.margins(0.05)
plt.grid()
plt.plot(s)





plt.tight_layout()
plt.show()
'''



import math

def goertzel(samples, sample_rate, freq):
	"""
	Implementation of the Goertzel algorithm, useful for calculating individual
	terms of a discrete Fourier transform.
	`samples` is a windowed one-dimensional signal originally sampled at `sample_rate`.
	The function returns 2 arrays, one containing the actual frequencies calculated,
	the second the coefficients `(real part, imag part, power)` for each of those frequencies.
	For simple spectral analysis, the power is usually enough.
	Example of usage :

		freqs, results = goertzel(some_samples, 44100, (400, 500), (1000, 1100))
	"""
	window_size = len(samples)
	f_step = sample_rate / float(window_size)
	f_step_normalized = 1.0 / window_size

	# Calculate all the DFT bins we have to compute to include frequencies
	# in `freqs`.
	bins = set()
	'''
	for f_range in freqs:
		f_start, f_end = f_range
		k_start = int(math.floor(f_start / f_step))
		k_end = int(math.ceil(f_end / f_step))

		if k_end > window_size - 1: raise ValueError('frequency out of range %s' % k_end)
		bins = bins.union(range(k_start, k_end))
'''
	# For all the bins, calculate the DFT term
	n_range = range(0, window_size)
	freqs = []
	results = []
#	for k in freq:
	k=freq

	# Bin frequency and coefficients for the computation
	f = k * f_step_normalized
	w_real = 2.0 * math.cos(2.0 * math.pi * f)
	w_imag = math.sin(2.0 * math.pi * f)

	# Doing the calculation on the whole sample
	d1, d2 = 0.0, 0.0
	for n in n_range:
		y  = samples[n] + w_real * d1 - d2
		d2, d1 = d1, y

	# Storing results `(real part, imag part, power)`
	results.append((
		0.5 * w_real * d1 - d2, w_imag * d1,
		d2**2 + d1**2 - w_real * d1 * d2)
		)
	freqs.append(f * sample_rate)
	return freqs, results


if __name__ == '__main__':
	# quick test
	import numpy as np
	import pylab

	# generating test signals
	SAMPLE_RATE = 44100
	WINDOW_SIZE = 1024
	t = np.linspace(0, 1, SAMPLE_RATE)[:WINDOW_SIZE]
	sine_wave = np.sin(2*np.pi*440*t) + np.sin(2*np.pi*1020*t)
	sine_wave2 = np.sin(2*np.pi*440*t) + np.sin(2*np.pi*1020*t)
	sine_wave2 = sine_wave2 * np.hamming(WINDOW_SIZE)

	# applying Goertzel on those signals, and plotting results
	freqs, results = goertzel(sine_wave, SAMPLE_RATE, 200)
	print(freqs,results)

	pylab.subplot(3, 2, 1)
	pylab.title('(1) Sine wave 440Hz + 1020Hz')
	pylab.plot(t, sine_wave)

	pylab.subplot(3, 2, 3)
	pylab.title('(1) Goertzel Algo, freqency ranges : [400, 500] and [1000, 1100]')
	plt.margins(0.05)
	plt.grid()
	for val in range(500):
		freqs, results = goertzel(sine_wave, SAMPLE_RATE, val)
		plt.plot(val, freqs,'b.')

	plt.subplot(3,2,5)
	plt.plot(abs(np.fft.fft(sine_wave))[:len(sine_wave)/2])

	freqs, results = goertzel(sine_wave2, SAMPLE_RATE, 400)

	pylab.subplot(3, 2, 2)
	pylab.title('(2) Sine wave 660Hz + 1200Hz')
	pylab.plot(t, sine_wave2)

	pylab.subplot(3, 2, 4)
	pylab.title('(2) Goertzel Algo, freqency ranges : [400, 500] and [1000, 1100]')
	pylab.plot(freqs, np.array(results)[:,2], 'o')
	pylab.ylim([0,100000])
	plt.subplot(3,2,6)
	plt.plot(abs(np.fft.fft(sine_wave2))[:len(sine_wave)/2])

	pylab.show()
