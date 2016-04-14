import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import wave

def decimate(x, q, n=None, ftype='iir', axis=-1):
    if not isinstance(q, int):
        raise TypeError("q must be an integer")

    if n is None:
        if ftype == 'fir':
            n = 30
        else:
            n = 8

    if ftype == 'fir':
        b = scipy.signal.firwin(n + 1, 1. / q, window='hamming')
        a = 1.
    else:
        b, a = scipy.signal.cheby1(n, 0.05, 0.8 / q)

    y = scipy.signal.lfilter(b, a, x, axis=axis)

    sl = [slice(None)] * y.ndim
    sl[axis] = slice(None, None, q)
    return y[sl]


spf = wave.open('websdr3.wav')
print(spf.getframerate())
print(spf.getnchannels())



signal = spf.readframes(-1)
print(signal[:10])

signal = np.fromstring(signal, 'Int16')

print(signal[:10])


plt.subplot(4,1,1)
plt.plot(signal)


plt.subplot(4,1,2)
plt.plot(abs(np.fft.fft(signal))[:(7500)/2])


signal=signal * np.sin(2*np.pi*77.5*np.arange(0,80,1.0/7500))[:589056]


plt.subplot(4,1,3)
plt.plot(signal)

plt.subplot(4,1,4)
plt.plot(abs(np.fft.fft(signal))[:(7500)/2])

print(spf.getparams())



plt.tight_layout()
plt.show()

