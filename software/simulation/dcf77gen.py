import matplotlib.pyplot as plt
import matplotlib.pylab as mpl
import matplotlib
import numpy as np
import commpy
import scipy.signal
import math
import datetime



def parity(bits):
	p = 0
	bits = bin(int(bits,2))[2:]

	for bit in bits:
		p ^= int(bit)
	return str(p)


dcf77 = ''

#antenna: 0 - normal, 1 - backup
antenna = '0'

#change of time: 0 - no, 1 - announcement of change (hour before change)
time_change = '0'

#summer time: 01 - CEST, 10 - CET
summer_time = '01'

#leap second: 0 - no leap second, 1 - additional leap second
leap_second = '0'

#today = datetime.datetime.now()
today = datetime.datetime(2001, 9, 22, 3, 33)

print(today);print()

#####

minute_ones = bin(int(str(today.strftime('%M'))[-1]))[2:].zfill(4)[::-1]
minute_tens = bin(int(str(today.strftime('%M'))[-2]))[2:].zfill(3)[::-1]
minute_parity = parity(minute_ones+minute_tens)
print('minute');print(minute_ones);print(minute_tens);print(minute_parity);print()


hour_ones = bin(int(str(today.strftime('%H'))[-1]))[2:].zfill(4)[::-1]
hour_tens = bin(int(str(today.strftime('%H'))[-2]))[2:].zfill(2)[::-1]
hour_parity = parity(hour_ones+hour_tens)
print('hour');print(hour_ones);print(hour_tens);print(hour_parity);print()

day_ones = bin(int(str(today.strftime('%d'))[-1]))[2:].zfill(4)[::-1]
day_tens = bin(int(str(today.strftime('%d'))[-2]))[2:].zfill(2)[::-1]
day_parity = parity(day_ones+day_tens)
print('day');print(day_ones);print(day_tens);print(day_parity);print()

weekday = bin(int(str(today.strftime('%w'))))[2:].zfill(2)[::-1]
print('weekday =', today.strftime('%w'));print(weekday);print()

month_ones = bin(int(str(today.strftime('%m'))[-1]))[2:].zfill(4)[::-1]
month_tens = bin(int(str(today.strftime('%m'))[-2]))[2:].zfill(1)[::-1]
month_parity = parity(month_ones+month_tens)
print('month');print(month_ones);print(month_tens);print(month_parity);print()

year_ones = bin(int(str(today.strftime('%y'))[-1]))[2:].zfill(4)[::-1]
year_tens = bin(int(str(today.strftime('%y'))[-2]))[2:].zfill(4)[::-1]
year_parity = parity(year_ones+year_tens)
print('year');print(year_ones);print(year_tens);print(year_parity);print()

date_parity = parity(hour_parity+day_parity+weekday+month_parity+year_parity)
print('date_parity');print(date_parity)

#####

# 0, start of transmission(0)
dcf77 += '0'
# 1-14 - meteotime
dcf77 += '0' * 14
# 15 antenna
dcf77 += antenna
# 16 time change
dcf77 += time_change
# 17-18 summer time
dcf77 += summer_time
# 19 leap second
dcf77 += leap_second

######

# 20 start time info (1)
dcf77 += '1'
# 21-24 bcd ones of minutes
dcf77 += minute_ones
# 25-27 tens of minutes
dcf77 += minute_tens
# 28 minutes parity - xor (21-27)
dcf77 += minute_parity
# 29-32 bcd ones of hour
dcf77 += hour_ones
# 33-34 bcd tens of hour
dcf77 += hour_tens
# 35 hour parity - xor (29-34)
dcf77 += hour_parity

####

# 36-39 bcd ones of month days
dcf77 += day_ones
# 40-41 bcd tens of month days
dcf77 += day_tens
# 42-44 bcd day of week
dcf77 += weekday
# 45-48 bcd ones of month
dcf77 += month_ones
# 49 bcd tens of month
dcf77 += month_tens
# 50-53 bcd ones of year
dcf77 += year_ones
# 54-57 bcd tens of year)
dcf77 += year_tens
# 58 - parity bit - xor(36-57)
dcf77 += date_parity

#59 - no amplitude modulation - indicator of new minute



print();print(dcf77)








