<Qucs Schematic 0.0.19>
<Properties>
  <View=186,226,911,691,1.86022,0,0>
  <Grid=10,10,1>
  <DataSet=lowpass_77.5kHz.dat>
  <DataDisplay=lowpass_77.5kHz.dpl>
  <OpenDisplay=1>
  <Script=lowpass_77.5kHz.m>
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
  <Pac P1 1 240 390 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 240 420 0 0 0 0>
  <L L1 1 390 390 8 -26 0 1 "82uH" 1 "" 0>
  <GND * 1 390 420 0 0 0 0>
  <L L2 1 500 310 -26 -44 0 0 "330uH" 1 "" 0>
  <L L3 1 530 390 8 -26 0 1 "27uH" 1 "" 0>
  <GND * 1 530 420 0 0 0 0>
  <L L4 1 640 310 -26 -44 0 0 "330uH" 1 "" 0>
  <L L5 1 670 390 8 -26 0 1 "82uH" 1 "" 0>
  <GND * 1 670 420 0 0 0 0>
  <Pac P2 1 780 390 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 780 420 0 0 0 0>
  <.SP SP1 1 290 490 0 67 0 0 "log" 1 "10kHz" 1 "450kHz" 1 "2001" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 510 500 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C1 1 360 390 -8 46 0 1 "50nF" 1 "" 0 "neutral" 0>
  <C C3 1 500 390 -8 46 0 1 "160nF" 1 "" 0 "neutral" 0>
  <C C5 1 640 390 -8 46 0 1 "47nF" 1 "" 0 "neutral" 0>
  <C C2 1 440 310 -26 10 0 0 "13nF" 1 "" 0 "neutral" 0>
  <C C4 1 580 310 -26 10 0 0 "13nF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <240 310 240 360 "" 0 0 0 "">
  <240 310 390 310 "" 0 0 0 "">
  <390 310 390 360 "" 0 0 0 "">
  <530 310 530 360 "" 0 0 0 "">
  <670 310 670 360 "" 0 0 0 "">
  <390 310 410 310 "" 0 0 0 "">
  <360 360 390 360 "" 0 0 0 "">
  <360 420 390 420 "" 0 0 0 "">
  <530 310 550 310 "" 0 0 0 "">
  <500 360 530 360 "" 0 0 0 "">
  <500 420 530 420 "" 0 0 0 "">
  <640 360 670 360 "" 0 0 0 "">
  <640 420 670 420 "" 0 0 0 "">
  <780 310 780 360 "" 0 0 0 "">
  <670 310 780 310 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 620 490 12 #000000 0 "Butterworth band-pass filter \n 60kHz...100kHz, pi-type, \n impedance matching 50 Ohm\n5th order">
</Paintings>
