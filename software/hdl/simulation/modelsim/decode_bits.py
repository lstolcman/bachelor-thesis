import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal


t=[0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1]

print('Input bits:')
print(''.join(str(x) for x in t))

print()

print('Decoded time:')
#rok
print('20',end='')
print(str(int(''.join(str(val) for val in t[54:58][::-1]), 2)),end='')
print(str(int(''.join(str(val) for val in t[50:54][::-1]), 2)),end='-')
#msc
print(str(int(''.join(str(val) for val in t[49:50][::-1]), 2)),end='')
print(str(int(''.join(str(val) for val in t[45:49][::-1]), 2)),end='-')
#dz
print(str(int(''.join(str(val) for val in t[40:42][::-1]), 2)),end='')
print(str(int(''.join(str(val) for val in t[36:40][::-1]), 2)),end=' ')
#godz
print(str(int(''.join(str(val) for val in t[33:34][::-1]), 2)),end='')
print(str(int(''.join(str(val) for val in t[29:33][::-1]), 2)),end=':')
#min
print(str(int(''.join(str(val) for val in t[25:28][::-1]), 2)),end='')
print(str(int(''.join(str(val) for val in t[21:25][::-1]), 2)))

print('Normal antenna') if t[15]==0 else print('Backup antenna')
print('Announcement of time change') if t[16]==1 else print('No time change')
print('Summer time') if t[18]==1 else print('Winter time')
print('No leap second') if t[19]==0 else print('Leap second')



'''
print()
print('min nizsza')
print((''.join(str(val) for val in t[21:25][::-1])),end='\t')
print(int(''.join(str(val) for val in t[21:25][::-1]), 2))
print('min wyzsza')
print((''.join(str(val) for val in t[25:28][::-1])),end='\t')
print(int(''.join(str(val) for val in t[25:28][::-1]), 2))

print('godz nizsza')
print((''.join(str(val) for val in t[29:33][::-1])),end='\t')
print(int(''.join(str(val) for val in t[29:33][::-1]), 2))
print('godz wyzsza')
print((''.join(str(val) for val in t[33:34][::-1])),end='\t')
print(int(''.join(str(val) for val in t[33:34][::-1]), 2))

print('dzen nizsza')
print((''.join(str(val) for val in t[36:40][::-1])),end='\t')
print(int(''.join(str(val) for val in t[36:40][::-1]), 2))
print('dzien wyzsza')
print((''.join(str(val) for val in t[40:42][::-1])),end='\t')
print(int(''.join(str(val) for val in t[40:42][::-1]), 2))

print('tydz ')
print((''.join(str(val) for val in t[42:45][::-1])),end='\t')
print(int(''.join(str(val) for val in t[42:45][::-1]), 2))

print('msc nizsza')
print((''.join(str(val) for val in t[45:49][::-1])),end='\t')
print(int(''.join(str(val) for val in t[45:49][::-1]), 2))
print('msc wyzsza')
print((''.join(str(val) for val in t[49:50][::-1])),end='\t')
print(int(''.join(str(val) for val in t[49:50][::-1]), 2))


print('rok nizsza')
print((''.join(str(val) for val in t[50:54][::-1])),end='\t')
print(int(''.join(str(val) for val in t[50:54][::-1]), 2))
print('rok wyzsza')
print((''.join(str(val) for val in t[54:58][::-1])),end='\t')
print(int(''.join(str(val) for val in t[54:58][::-1]), 2))
'''


'''
22.22.1992 22:22
czas letni/zimowy
Uwagi:
- nadchodzacy czas letni
- nadchodzaca sek przestepna
- parity  minuty niepoprzawne 
- poczatkesygnalu nieporawny
'''





