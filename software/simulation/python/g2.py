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







iii = []

s= -10
aa=1
for val in range(0, 100):
	fs=100
	x=2
	f1=20


	if (val%10==0):
		if aa<1:
			aa=1
		else:
			aa=0.1



	s1 = aa*np.sin(2*np.pi*f1*np.arange(0, x, 1.0/fs))
	s1 = s1 + awgn(np.arange(0, x, 1.0/fs), s)


	mag2=[]
	for target_f in range(1,int(fs/2)):

		N = x*fs
		k = int(.5+ (N*target_f/fs))

		w = (2*np.pi/N)*k
		cosine = np.cos(w)
		sine = np.sin(w)
		coeff = 2*cosine

		q0=0;q1=0;q2=0
		for num in range(N):
			q0 = coeff*q1-q2+s1[num]
			q2=q1
			q1=q0
		mag2 = mag2+[q1*q1+q2*q2-q1*q2*coeff]

	iii=iii+[mag2/max(mag2)]





plt.subplot(1,3,1)
plt.imshow(iii)
plt.subplot(1,3,2)
plt.imshow(np.log2(iii))
plt.subplot(1,3,3)
plt.imshow(np.log10(iii))







plt.tight_layout()
plt.show()


