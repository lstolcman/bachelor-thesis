<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1381,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=lowpass_60MHz_butterworth.dat>
  <DataDisplay=lowpass_60MHz_butterworth.dpl>
  <OpenDisplay=1>
  <Script=lowpass_60MHz_butterworth.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 240 370 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 240 400 0 0 0 0>
  <GND * 1 350 400 0 0 0 0>
  <L L1 1 420 290 -26 10 0 0 "160nH" 1 "" 0>
  <GND * 1 490 400 0 0 0 0>
  <L L2 1 560 290 -26 10 0 0 "270nH" 1 "" 0>
  <GND * 1 630 400 0 0 0 0>
  <L L3 1 700 290 -26 10 0 0 "160nH" 1 "" 0>
  <GND * 1 770 400 0 0 0 0>
  <Pac P2 1 880 370 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 880 400 0 0 0 0>
  <.SP SP1 1 250 470 0 67 0 0 "log" 1 "6MHz" 1 "600MHz" 1 "2001" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 470 480 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C1 1 350 370 17 -26 0 1 "24pF" 1 "" 0 "neutral" 0>
  <C C4 1 770 370 17 -26 0 1 "24pF" 1 "" 0 "neutral" 0>
  <C C3 1 630 370 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
  <C C2 1 490 370 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <240 290 240 340 "" 0 0 0 "">
  <240 290 350 290 "" 0 0 0 "">
  <350 290 350 340 "" 0 0 0 "">
  <490 290 490 340 "" 0 0 0 "">
  <630 290 630 340 "" 0 0 0 "">
  <770 290 770 340 "" 0 0 0 "">
  <350 290 390 290 "" 0 0 0 "">
  <450 290 490 290 "" 0 0 0 "">
  <490 290 530 290 "" 0 0 0 "">
  <590 290 630 290 "" 0 0 0 "">
  <630 290 670 290 "" 0 0 0 "">
  <730 290 770 290 "" 0 0 0 "">
  <880 290 880 340 "" 0 0 0 "">
  <770 290 880 290 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 580 470 12 #000000 0 "Butterworth low-pass filter \n 60MHz cutoff, pi-type, \n impedance matching 50 Ohm">
</Paintings>
