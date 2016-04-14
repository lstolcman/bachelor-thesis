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



s=awgn(s,-20)
plt.subplot(4,2,3)
plt.margins(0.05)
plt.grid()
plt.plot(s)


plt.subplot(5,2,4)
plt.margins(0.05)
mpl.xticks(range(0, int(len(s)/2), int(1024/64)), range(0, 512, 8), rotation=90)
plt.xlabel('Frequency [Hz]')
plt.grid()
plt.plot(abs(np.fft.fft(s))[:len(s)/2])




taps = scipy.signal.firwin(1024, [.14, .17], window='hamming', pass_zero=False)
s = np.convolve(s, taps, mode='same')

plt.subplot(5,2,5)
plt.margins(0.05)
plt.grid()
plt.plot(abs(s))


plt.subplot(5,2,6)
plt.margins(0.05)
mpl.xticks(range(0, int(len(s)/2), int(1024/64)), range(0, 512, 8), rotation=90)
plt.xlabel('Frequency [Hz]')
plt.grid()
plt.plot(abs(np.fft.fft(s))[:len(s)/2])


s000 = np.sin(2*np.pi*77.5*np.arange(0, 2, 1.0/1024)+np.pi/7)
s=np.delete(s, -1)
print(len(s))
print(len(s000))
s=s000*s
plt.subplot(5,2,7)
plt.margins(0.05)
plt.grid()
plt.plot(abs(s))


plt.subplot(5,2,8)
plt.margins(0.05)
mpl.xticks(range(0, int(len(s)/2), int(1024/64)), range(0, 512, 8), rotation=90)
plt.xlabel('Frequency [Hz]')
plt.grid()
plt.plot(abs(np.fft.fft(s))[:len(s)/2])






taps = scipy.signal.firwin(1024, .1, window='hamming', pass_zero=True)
s = np.convolve(s, taps, mode='same')

plt.subplot(5,2,9)
plt.margins(0.05)
plt.grid()
plt.plot(abs(s)/max((s)))


plt.subplot(5,2,10)
plt.margins(0.05)
mpl.xticks(range(0, int(len(s)/2), int(1024/64)), range(0, 512, 8), rotation=90)
plt.xlabel('Frequency [Hz]')
plt.grid()
plt.plot(abs(np.fft.fft(s))[:len(s)/2])






plt.tight_layout()
plt.show()

