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
    narrow band filter
    multiply with 2 versions of a 20kHz sine wave, 90° apart (thus sine and cosine), low pass filter, and add following Pythagoras' rule (add squares, squareroot sum).
'''



fs = 1000
t100ms = np.arange(0, .1, 1.0/fs)
t200ms = np.arange(0, .2, 1.0/fs)
t800ms = np.arange(0, .8, 1.0/fs)
t900ms = np.arange(0, .9, 1.0/fs)
f0 = 77.5
phi = 0
Alow = .25
Ahigh = 1.0

startbit = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs))
startbitn = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs)+np.pi)
one = startbit * np.append(np.ones(fs/10)*.25, np.ones(fs*(9/10)))
onen = startbitn * np.append(np.ones(fs/10)*.25, np.ones(fs*(9/10)))
#zero = np.append(Alow*np.sin(2*np.pi*f0*t100ms), Ahigh*np.sin(2*np.pi*f0*t900ms))
#one = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs)) * (np.append()

s = startbit
s = np.append(s, onen)
s = np.append(s, one)

a = np.sin(2*np.pi*77.5*np.arange(0,1,1.0/fs))
aa = np.sin(2*np.pi*77.5*np.arange(0,1,1.0/fs)+np.pi)
b = np.sin(2*np.pi*100*np.arange(0,1,1.0/fs))


s=awgn(s,-20)

plt.subplot(5,2,1)
plt.margins(0.05)
plt.grid()
plt.plot(s)

plt.subplot(5,2,2)
plt.margins(0.05)
plt.grid()
plt.plot(abs(np.fft.fft(s)))

filtered =s

iqc = s * np.cos(2*np.pi*f0*3*np.arange(0,1,1.0/(fs*3)))
iqs = s * -np.sin(2*np.pi*f0*3*np.arange(0,1,1.0/(fs*3)))

'''
1500 - 1
232,5 - x
230 - .15333
235 - .15666

227.5 - .151666
237.5 - .158333


200 - .13333
260 - .17333
'''


taps = scipy.signal.firwin(fs, [.1333, .17333], window='hamming', pass_zero=False)
s = np.convolve(s, taps, mode='same')




plt.subplot(5,2,3)
plt.margins(0.05)
plt.grid()
plt.plot(s)


plt.subplot(5,2,4)
plt.margins(0.05)
plt.grid()
plt.plot(abs(np.fft.fft(s)))




ss = s * np.sin(2*np.pi*f0*3*np.arange(0,1,1.0/(fs*3)))

taps = scipy.signal.firwin(fs, .10, window='hamming', pass_zero=True)
ss = np.convolve(ss, taps, mode='same')


plt.subplot(5,2,5)
plt.margins(0.05)
plt.grid()
plt.plot(ss)


plt.subplot(5,2,6)
plt.margins(0.05)
plt.grid()
plt.plot(abs(np.fft.fft(ss)))





sc = s * np.cos(2*np.pi*f0*3*np.arange(0,1,1.0/(fs*3)))
taps = scipy.signal.firwin(fs, .10, window='hamming', pass_zero=True)
sc = np.convolve(sc, taps, mode='same')


plt.subplot(5,2,7)
plt.margins(0.05)
plt.grid()
plt.plot(sc)


plt.subplot(5,2,8)
plt.margins(0.05)
plt.grid()
plt.plot(abs(np.fft.fft(sc)))




sq = sc+ss

plt.subplot(5,2,9)
plt.margins(0.05)
plt.grid()
plt.plot(abs(sq))


plt.subplot(5,2,10)
plt.margins(0.05)
plt.grid()
plt.plot(abs(np.fft.fft(sq)))


















plt.tight_layout()
plt.show()

