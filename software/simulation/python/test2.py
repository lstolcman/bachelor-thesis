import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal

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


fs = 10000000
f0 = 77.5
phi = 0
Alow = .25
Ahigh = 1.0

s = Ahigh*np.sin(2*np.pi*f0*np.arange(0, 1, 1.0/fs))+Ahigh*np.sin(2*np.pi*43.23145*np.arange(0, 1, 1.0/fs))


plt.margins(0.05)
plt.grid()
plt.plot(s[::1000])



plt.tight_layout()
plt.show()

