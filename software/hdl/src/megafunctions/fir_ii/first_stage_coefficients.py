import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal




sample_rate = 130000
nyq_rate = sample_rate / 2.0

width = 2000/nyq_rate

ripple_db = 60.0

N, beta = scipy.signal.kaiserord(ripple_db, width)

# The cutoff frequency of the filter.
cutoff_hz = 20000

taps = scipy.signal.firwin(N, cutoff_hz/nyq_rate, window=('kaiser', beta))

#50 taps = scipy.signal.firwin(128, [.16, .2], window='hamming', pass_zero=False)
#taps = scipy.signal.firwin(128, [.224, .226], window='hamming', pass_zero=False)

#taps=taps[35:-35]

plt.subplot(2,1,1);plt.plot(taps, 'o-')
plt.margins(0.1);plt.grid()
plt.subplot(2,1,2);plt.plot(abs(np.fft.fft(taps)), 'o-')
plt.margins(0.1);plt.grid()

plt.show()


f = open('first_stage_coefficients.txt','w')
for val in taps:
	f.write(str((val)))
	f.write(', ')



