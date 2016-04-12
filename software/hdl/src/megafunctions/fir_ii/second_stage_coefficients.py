import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal




sample_rate = 130000
nyq_rate = sample_rate / 2.0

width = 500/nyq_rate

ripple_db = 60.0

N, beta = scipy.signal.kaiserord(ripple_db, width)

# The cutoff frequency of the filter.
cutoff_hz = 650

#taps = scipy.signal.firwin(N, cutoff_hz/nyq_rate, window=('kaiser', beta))

taps = scipy.signal.firwin(128, [.11, .13], window='hamming', pass_zero=False)
#taps = scipy.signal.firwin(128, .8, window='hamming', pass_zero=True)


plt.subplot(2,1,1);plt.plot(taps, 'o-')
plt.margins(0.1);plt.grid()
plt.subplot(2,1,2);plt.plot(abs(np.fft.fft(taps)[:len(taps)/2]), 'o-')
plt.margins(0.1);plt.grid()

plt.show()


f = open('second_stage_coefficients.txt','w')
for val in taps:
	f.write(str((val)))
	f.write(', ')



