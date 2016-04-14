import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import time




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






fs = 2500

f0 = 77.5
phi = 0
Ahigh = 1
Alow=0.25


startbit = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs))
startbitn = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs)+np.pi)
one = startbit * np.append(np.ones(fs*(5/10))*.25, np.ones(fs*(5/10)))
onen = startbitn * np.append(np.ones(fs/10)*.25, np.ones(fs*(9/10)))
#zero = np.append(Alow*np.sin(2*np.pi*f0*t100ms), Ahigh*np.sin(2*np.pi*f0*t900ms))
#one = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs)) * (np.append()

s=one

s=awgn(s,-22)



plt.ion()

plt.plot()
plt.grid()
#plt.ylim([-1, 60])
#plt.xlim([-2, 258])
plt.margins(0.05)
plt.show()


dziel=50
rang=200

taps = scipy.signal.firwin(fs/2, [.01, .1], window='hamming', pass_zero=False)
s = np.convolve(s, taps, mode='same')

ss=s
f=abs(np.fft.fft(ss))

for v in range(0, fs-rang, int(fs/dziel)):
	plt.clf()

	s=ss
	#plt.ylim([-1, 280])
	#plt.xlim([-2, 252])



	plt.subplot(3,1,1)
	plt.margins(0.05)
	plt.grid()
	plt.plot(s)
	plt.plot((v,v),(-4,4), 'r')
	plt.plot((v+rang,v+rang),(-4,4), 'r')


	plt.subplot(3,1,2)
	plt.margins(0.05)
	plt.grid()
	plt.plot(f)



	s=ss[v:v+rang]
	plt.subplot(3,1,3)
	plt.margins(0.05)
	plt.grid()
	plt.ylim([-5,350])
	plt.plot(abs(np.fft.fft(s)))


	'''
	taps = scipy.signal.firwin(fs/2/dziel, [.4, .8], window='hamming', pass_zero=False)
	s = np.convolve(s, taps, mode='same')


	plt.subplot(4,2,3)
	plt.margins(0.05)
	plt.grid()
	plt.plot(s)

	plt.subplot(4,2,4)
	plt.margins(0.05)
	plt.grid()
	plt.plot(abs(np.fft.fft(s)))


	iqc = s * np.cos(2*np.pi*70*np.arange(0,1,1.0/(fs/dziel)))
	iqs = s * -np.sin(2*np.pi*70*np.arange(0,1,1.0/(fs/dziel)))


	plt.subplot(4,2,5)
	plt.margins(0.05)
	plt.grid()
	plt.plot(iqc)
	plt.plot(iqs)


	plt.subplot(4,2,6)
	plt.margins(0.05)
	plt.grid()
	plt.plot(abs(np.fft.fft(iqc)))
	plt.plot(abs(np.fft.fft(iqs)))


	taps = scipy.signal.firwin(fs/2, .2, window='hamming', pass_zero=True)
	iqs = np.convolve(iqs, taps, mode='same')
	iqc = np.convolve(iqc, taps, mode='same')


	plt.subplot(4,2,7)
	plt.margins(0.05)
	plt.grid()
	plt.plot(iqc)
	plt.plot(iqs)
	plt.plot(np.sqrt(iqs*iqs+iqc*iqc))


	plt.subplot(4,2,8)
	plt.margins(0.05)
	plt.grid()
	plt.plot(abs(np.fft.fft(iqc)))
	plt.plot(abs(np.fft.fft(iqs)))


	'''
	plt.draw()
	time.sleep(0.2)


#plt.tight_layout()
#plt.show()

