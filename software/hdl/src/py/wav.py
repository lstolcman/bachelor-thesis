import numpy as np

import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal

import serial

import threading

import wave
import struct

import array




'''

f = wave.open('u8.wav','rb')
g = wave.open('u8m.wav','wb')

print(f.getparams())
g.setsampwidth(2)
g.setnchannels(1)
g.setframerate(22000)
g.writeframesraw(f.readframes(f.getnframes()))

f.rewind()
plt.plot(list(f.readframes(f.getnframes())))
plt.show()

'''

#http://stackoverflow.com/questions/20962350/changing-bytes-python-3-string-output-back-to-list-of-ints



raw = open('capture.txt', 'rb')

f = wave.open('aaaaa.wav', 'wb')

f.setsampwidth(1)
f.setnchannels(1)
f.setframerate(10000)
f.writeframesraw(raw.read())




