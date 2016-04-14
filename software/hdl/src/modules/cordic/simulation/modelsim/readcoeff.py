import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal





vals=[]
f = open('dataout.txt','r')
lines = f.readlines()
f.close()
for l in lines:
	if (l[0] != '/' and l[0] != 'x' and len(l)>0 and l[0] != '\n'):
		if (l[0] == '1'):
			vals.append(-int(bin((int(l,2)^0b11111111111111111111)+1),2))
		else:
			vals.append(int(l,2))





plt.subplot(2,1,1);plt.plot(vals,'o-')
plt.subplot(2,1,2);plt.plot(abs(np.fft.fft(vals)),'o-')


plt.show()



