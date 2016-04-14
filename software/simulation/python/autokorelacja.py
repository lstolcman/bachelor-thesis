#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
# coding: utf-8


import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import copy

# polskie fonty
matplotlib.rc('font', **{'sans-serif' : 'Arial', 'family' : 'sans-serif'})

class trigfn:
	def __init__(self, wave=np.sin, buf=(0, 1), sampl=1024, freq=1, ampl=1, phase=0, label=''):
		'''
		* wave - "np.sin", "np.cos" or points list explicite
		* buf - buffer size
			(<from>, <to>)
		* sampl - sampling in Hz
		* freq - frequency in Hz
		* ampl - amplitude
		* phase - phase in degrees
		* label - label for plot/legend

		'''
		self.wave = wave
		self.buf = buf
		self.sampl = sampl
		self.freq = freq
		self.ampl = ampl
		self.phase = phase
		self.label = label

		self.raw_dft = None
		self.real_dft = None
		self.fig = None
		self.pwa = []

		self.inputs = np.arange(self.buf[0], self.buf[1], 1/self.sampl)
		self.fninputs = self.inputs*2*np.pi
		if isinstance(wave, np.ufunc):
			self.fnoutputs = self.ampl*self.wave(self.freq*self.fninputs + (self.phase%360/360)*2*np.pi)
		else:
			self.fnoutputs = wave

	def copy(self):
		return copy.deepcopy(self)

	def plot(self, arg=None):
		self.plott(arg)

	def plott(self, arg=None):
		'''
		Plot samples in time domain
		'''
		if (arg is not None):
			arg.grid(True)
			arg.plot(self.fninputs, self.fnoutputs, label=self.label)
		else:
			mpl.grid(True)
			mpl.plot(self.fninputs, self.fnoutputs, label=self.label)

		mpl.plot(self.fninputs, np.zeros(len(self.fninputs)), 'k')
		mpl.margins(0.05)

	def plotf(self, data=None):
		'''
		Plot in frequency domain (DFT on samples and then plot)
		'''
		if data is None:
			if (self.raw_dft is None):
				self.fft()
			mpl.grid(True)
			mpl.plot(range(0, len(self.real_dft)), self.real_dft, c='gray', ls='-')
			for i, p in enumerate(self.real_dft):
				if (p>1e-10):
					point, = mpl.plot(i, p, 'ro', ms=5)
					if self.fig:
						'''
						http://stackoverflow.com/questions/11537374/matplotlib-basemap-popup-box/11556140#11556140
						we can set self.fig and hover a mouse over a point to see
						annotation with frequency and amplitude in dft graph
						'''
						annotation = mpl.annotate("F=%sHz\nA=%s" % (i, p),
								xy=(i, p), xycoords='data', xytext=(i, p), textcoords='data', horizontalalignment="right", 
								bbox=dict(boxstyle="round", facecolor="w", edgecolor="0.5", alpha=0.9))
						annotation.set_visible(False)
						self.pwa.append([point, annotation])

				else:
					mpl.plot(i, p, 'ko', ms=3)
			if self.fig:
				self.fig.canvas.mpl_connect('motion_notify_event', self.on_move)
			mpl.xticks(range(0, len(self.real_dft),  int(self.sampl/32) if int(self.sampl/32)>0 else 1), rotation=0)
			mpl.margins(0.05)
			mpl.xlabel('Frequency [Hz]')
			mpl.ylabel('Amplitude')
		else:
			mpl.grid(True)
			mpl.plot(range(0, len(data)), data, c='gray', ls='-')
			for i, p in enumerate(data):
				if (p>1e-10):
					point, = mpl.plot(i, p, 'ro', ms=5)
				else:
					mpl.plot(i, p, 'ko', ms=3)
			mpl.margins(0.05)
			mpl.ylabel('Amplitude')

	def norm(self):
		self.fnoutputs /= np.max(self.fnoutputs)

	def pnorm(self):
		# 'Positive' normalization: points from 0 to 1
		self.fnoutputs -= np.min(self.fnoutputs)
		self.fnoutputs /= np.max(self.fnoutputs)

	def am(self, input_signal, kmod=0.5):
		#if isinstance(input_signal, trigfn):
		#	self.fnoutputs = (1+kmod*input_signal.fnoutputs)*self.wave(self.freq*self.fninputs + (self.phase%360/360)*2*np.pi)
		#else:
		ret = self.copy()
		ret.fnoutputs = (1+kmod*input_signal.fnoutputs)*ret.fnoutputs
		#raise NotImplementedError("Modulation for points not implemented")
		return ret

	def pm(self, input_signal, kmod=0.5):
		ret = self.copy()
		if isinstance(input_signal, trigfn):
			ret.fnoutputs = ret.ampl*ret.wave(ret.freq*ret.fninputs + (ret.phase%360/360+kmod*input_signal.fnoutputs)*2*np.pi)
		else:
			raise NotImplementedError("Modulation for points not implemented")
		return ret


	def show(self, title=None):
		if (title is not None):
			mpl.title(title)
		self.plot()
		#float unstability errors fix
		#mpl.ylim(1e-6)
		mpl.show()

	def dft(self):
		self.raw_dft = np.zeros(np.size(self.fnoutputs), dtype=complex)
		N = np.size(self.fninputs)
		for k in range(N):
			for n, x in enumerate(self.fnoutputs):
				self.raw_dft[k] += x * (np.cos((2*np.pi*k*n)/N)-1j*np.sin((2*np.pi*k*n)/N))

		self.real_dft = np.absolute(self.raw_dft[0:len(self.raw_dft)/2+1])/N*2

	def fft(self, data=None):
		if data is None:
			self.raw_dft = np.fft.fft(self.fnoutputs)
			N = np.size(self.fninputs)
			self.real_dft = np.absolute(self.raw_dft[0:len(self.raw_dft)/2+1])/N*2
		else:
			dataout = np.fft.fft(data)
			N = np.size(data)
			realout = np.absolute(dataout[0:len(data)/2+1])/N*2
			return realout

	def __add__(self, other):
		if isinstance(other, trigfn):
			return trigfn(wave=self.fnoutputs+other.fnoutputs, buf=self.buf, sampl=self.sampl)
		else:
			return trigfn(wave=self.fnoutputs+other, buf=self.buf, sampl=self.sampl)

	def __sub__(self, other):
		if isinstance(other, trigfn):
			return trigfn(wave=self.fnoutputs-other.fnoutputs, buf=self.buf, sampl=self.sampl)
		else:
			return trigfn(wave=self.fnoutputs-other, buf=self.buf, sampl=self.sampl)

	def __mul__(self, other):
		if isinstance(other, trigfn):
			return trigfn(wave=self.fnoutputs*other.fnoutputs, buf=self.buf, sampl=self.sampl)
		else:
			return trigfn(wave=self.fnoutputs*other, buf=self.buf, sampl=self.sampl)

	def __truediv__(self, other):
		if isinstance(other, trigfn):
			return trigfn(wave=self.fnoutputs/other.fnoutputs, buf=self.buf, sampl=self.sampl)
		else:
			return trigfn(wave=self.fnoutputs/other, buf=self.buf, sampl=self.sampl)


	def on_move(self, event):
		for point, annotation in self.pwa:
			should_be_visible = (point.contains(event)[0] == True)
			if should_be_visible != annotation.get_visible():
				annotation.set_visible(should_be_visible)
				mpl.draw()



class modulation(trigfn):
	def __init__(self):
		pass


class keying(trigfn):
	def __init__(self):
		#self.freq = freq
		#self.sampl = sampl
		self.signal_ask = None
		self.signal_fsk = None
		self.signal_psk = None

	def ask(self, bits, freq=100, sampl=None):
		if sampl is None:
			sampl = 40*freq
		self.signal_ask = trigfn(buf=(0, len(bits)/freq), freq=freq, sampl=sampl)
		ii = -1
		bit_sample = int(sampl/freq)
		for i, x in enumerate(self.signal_ask.fnoutputs):
			if (i%bit_sample == 0):
				ii += 1
			if (bits[ii] == '0'):
				self.signal_ask.fnoutputs[i] = 0
	
	def fsk(self, bits, freq=100, freq2=None, sampl=None):
		if sampl is None:
			sampl = 40*freq
		if freq2 is None:
			freq2 = freq*2
		self.signal_fsk = trigfn(buf=(0, len(bits)/freq), freq=freq, sampl=sampl)
		self.signal2 = trigfn(buf=(0, len(bits)/freq), freq=freq2, sampl=sampl)
		ii = -1
		bit_sample = int(sampl/freq)
		for i, x in enumerate(self.signal_fsk.fnoutputs):
			if (i%bit_sample == 0):
				ii += 1
			if (bits[ii] == '1'):
				self.signal_fsk.fnoutputs[i] = self.signal2.fnoutputs[i]

	def psk(self, bits, freq=100, sampl=None):
		if sampl is None:
			sampl = 40*freq
		self.signal_psk = trigfn(buf=(0, len(bits)/freq), freq=freq, sampl=sampl)
		self.signal1 = trigfn(buf=(0, len(bits)/freq), freq=freq, sampl=sampl, phase=180)
		ii = -1
		bit_sample = int(sampl/freq)
		for i, x in enumerate(self.signal_psk.fnoutputs):
			if (i%bit_sample == 0):
				ii += 1
			if (bits[ii] == '0'):
				self.signal_psk.fnoutputs[i] = self.signal1.fnoutputs[i]
	
	def plot_ask(self, bits='010101', freq=100, sampl=None):
		if self.signal_ask is None:
			self.ask(bits, freq, sampl)
		self.signal_ask.plot()


	def plot_fsk(self, bits='010101', freq=100, freq2=None, sampl=None):
		if self.signal_fsk is None:
			self.fsk(bits, freq, freq2, sampl)
		self.signal_fsk.plot()


	def plot_psk(self, bits='010101', freq=100, sampl=None):
		if self.signal_psk is None:
			self.psk(bits, freq, sampl)
		self.signal_psk.plot()
	
	def plotf_ask(self):
		if self.signal_ask is None:
			raise IOError('No signal. Generate signal first')
		self.plotf(self.fft(self.signal_ask.fnoutputs))

	def plotf_fsk(self):
		if self.signal_fsk is None:
			raise IOError('No signal. Generate signal first')
		self.plotf(self.fft(self.signal_fsk.fnoutputs))

	def plotf_psk(self):
		if self.signal_psk is None:
			raise IOError('No signal. Generate signal first')
		self.plotf(self.fft(self.signal_psk.fnoutputs))


	def demod_ask(self):
		sum = 0
		demod_bits = ''
		tmp = abs(self.signal_ask.fnoutputs)
		# simple sine wave to compute boundary
		comp = trigfn(buf=x.signal_ask.buf, freq=x.signal_ask.freq, sampl=x.signal_ask.sampl)
		# boundary for single wave period - bit above -> '1', bit below -> '0'
		boundary = round(np.sum(abs(comp.fnoutputs[:len(comp.fnoutputs)/len(bits)]))/2)
		for i in range(len(self.signal_ask.fnoutputs)):
			if (i != 0 and i < len(self.signal_ask.fnoutputs)-1):
				sum += tmp[i]
				#check for bit value every wave period
				if (i % (len(x.signal_ask.fnoutputs)/len(bits)) == 0):
					demod_bits += '1' if sum>boundary else '0'
					sum=0
		demod_bits += '1' if sum>boundary else '0'
		return demod_bits


def norm(input_signal):
	input_signal += abs(min(input_signal))
	input_signal /= (max(input_signal)/2)
	input_signal -= 1
	return input_signal


def rms(inp):
	inp = np.array(inp)
	return np.sqrt(np.mean(inp ** 2))



def Rxy(inx, iny):
	sx = np.size(inx)
	sy = np.size(iny)
	rxy = np.zeros(sx)
	for t in range(sx):
		tmp = 0
		for n in range(ns):
			if (n+t < sx):
				tmp += inx[n]*iny[n+t]
		rxy[t] = tmp
	return rxy

def Rxx(inx):
	return Rxy(inx, inx)



ns = 500
#skalowanie do [-1;+1]
no = np.random.normal(0, 1, ns)
no += abs(min(no))
no /= max(no)/2
no -= 1



a = trigfn(sampl=ns, freq=8, phase=90)
b = trigfn(sampl=ns, freq=12, phase=90)
y=a+b
y=y/4




mpl.figure()

mpl.subplot(4,1,1)
mpl.plot(no)
mpl.title('szum')
mpl.margins(0.05)
mpl.grid()

mpl.subplot(4,1,2)
mpl.grid()
y.plot()
mpl.title('fala okresowa')
mpl.margins(0.05)

ni = y.fnoutputs + no/2
mpl.subplot(4,1,3)
mpl.plot(ni)
mpl.title('szum + fala okresowa')
mpl.margins(0.05)
mpl.grid()

mpl.subplot(4,1,4)
rxx = Rxx(ni)

# szukanie pierwszego minimum i maksimum
rxxmin = np.argmin(rxx)
rxxmax = rxxmin+np.argmax(rxx[rxxmin+1:])
# czestotliwosc 'malejacego sinusa' jest stała więc można przyjąć, że rxxmax == 2*rxxmin
#rxxmax = 2*rxxmin


mpl.plot(rxx)
mpl.title('autokorelacja sygnału, pierwsze maksimum po '+str(rxxmax)+' próbkach, wyznaczona częstotliwość: '+str(round((y.sampl/rxxmax)*1000)/1000)+'Hz')
mpl.plot(rxxmax, rxx[rxxmax], 'r.', markersize=8)
mpl.margins(0.05)
mpl.grid()


mpl.tight_layout()

mpl.show()



