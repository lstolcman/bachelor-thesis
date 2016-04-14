import numpy as np

import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal

import serial

import threading



with open('ant', mode='rb') as file: # b is important -> binary
    fileContent = file.read()

print(len(fileContent))
#arr=arr+ [np.fromstring(word, dtype=np.uint16)]

#np.savetxt('arr.txt', arr)
arr = np.fromstring(fileContent, dtype=np.uint16, count=int((len(fileContent)-1)/2))

ser = serial.Serial('COM1', 115200*2, timeout=1,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)

d=0
dm1=0
a=[0,]
aa=[]
mpl.plot(1,1,'.b')
mpl.show(block=False)
mpl.ylim(-1,280)
while True:
	d=((np.fromstring(ser.read(1), dtype=np.uint8)))
	if 1:#(dm1!=d):
		a=np.append(a,d)
		print(len(a))
		if len(a) == 256:
			aa=a.copy()
			a=[]
			plt.clf()
			mpl.subplot(2,1,1)
			mpl.plot(aa)
			mpl.ylim(0,280)
			mpl.xlim(0,256)
			mpl.subplot(2,1,2)
			mpl.xlim(-10,256)
			mpl.ylim(0,15000)
			mpl.plot(abs(np.fft.fft(aa)))
			mpl.draw()
		dm1=d
