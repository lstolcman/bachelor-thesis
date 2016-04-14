import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal








fs = 128

s1 = np.sin(2*np.pi*5*np.arange(0, 1, 1.0/fs))
s2 = np.sin(2*np.pi*30*np.arange(0, 1, 1.0/fs)+np.pi)

ss=s1+s2


u=[
0.0176663, 0.013227, 0.0, -0.0149911, -0.0227152, -0.0172976, 0.0, 0.0204448, 0.0318046, 0.0249882, 0.0, -0.0321283, -0.0530093, -0.04498, 0.0, 0.0749693, 0.159034, 0.224907, 0.249809, 0.224907, 0.159034, 0.0749693, 0.0, -0.04498, -0.0530093, -0.0321283, 0.0, 0.0249882, 0.0318046, 0.0204448, 0.0, -0.0172976, -0.0227152, -0.0149911, 0.0, 0.013227, 0.0176663
]

s=[
0.015736, 0.011802, 0.0, -0.013769, -0.021637, -0.015736, 0.0, 0.01967, 0.031472, 0.023604, 0.0, -0.031472, -0.051142, -0.043274, 0.0, 0.07474599999999999, 0.15736, 0.224238, 0.249809, 0.224238, 0.15736, 0.07474599999999999, 0.0, -0.043274, -0.051142, -0.031472, 0.0, 0.023604, 0.031472, 0.01967, 0.0, -0.015736, -0.021637, -0.013769, 0.0, 0.011802, 0.015736
]
f=[
8, 6, 0, -7, -11, -8, 0, 10, 16, 12, 0, -16, -26, -22, 0, 38, 80, 114, 127, 114, 80, 38, 0, -22, -26, -16, 0, 12, 16, 10, 0, -8, -11, -7, 0, 6, 8		
		]



ss=ss-min(ss)
ss=ss/max(ss)
ss=(ss*255).astype(int)

vals=[]
f = open('memory_hex.txt','r')
for val in ss:
	l=f.readline()
	if (l[0] != '/'):
		vals.append(int(l,16))
f.close()



taps = scipy.signal.firwin(fs, .1, window='hamming', pass_zero=True)
#filtered = np.convolve(filtered*np.append(np.append(a,aa),a), taps, mode='same')


plt.subplot(4,2,1);plt.plot(ss)
plt.subplot(4,2,2);plt.plot(abs(np.fft.fft(ss))[:fs/2])
#ss=np.convolve(ss, u, mode='same')
taps = scipy.signal.firwin(fs/2, .2, window='hamming', pass_zero=True)
ss = np.convolve(ss, taps, mode='same')
plt.subplot(4,2,3);plt.plot(ss)
plt.subplot(4,2,4);plt.plot(abs(np.fft.fft(ss))[:fs/2])
plt.subplot(4,2,5);plt.plot(taps[10:len(taps)-10])
plt.subplot(4,2,6);plt.plot(abs(np.fft.fft(taps))[:fs/2])
plt.subplot(4,2,7);plt.plot(vals)
plt.subplot(4,2,8);plt.plot(abs(np.fft.fft(vals)))


plt.show()

#taps=taps-min(taps)
#taps=taps/max(taps)*2**8

#plt.subplot(6,1,5)
#plt.plot(taps)
#plt.show()

f = open('coef.txt','w')
for val in taps:
	f.write(str((val)))
	f.write(', ')



