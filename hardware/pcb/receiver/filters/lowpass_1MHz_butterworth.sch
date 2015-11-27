<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1131,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=lowpass_1MHz_butterworth.dat>
  <DataDisplay=lowpass_1MHz_butterworth.dpl>
  <OpenDisplay=1>
  <Script=lowpass_1MHz_butterworth.m>
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
  <Pac P1 1 250 340 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 250 370 0 0 0 0>
  <C C1 1 360 340 17 -26 0 1 "1.417nF" 1 "" 0 "neutral" 0>
  <GND * 1 360 370 0 0 0 0>
  <L L1 1 430 260 -26 10 0 0 "10uH" 1 "" 0>
  <C C2 1 500 340 17 -26 0 1 "5.736nF" 1 "" 0 "neutral" 0>
  <GND * 1 500 370 0 0 0 0>
  <L L2 1 570 260 -26 10 0 0 "16uH" 1 "" 0>
  <C C3 1 640 340 17 -26 0 1 "5.736nF" 1 "" 0 "neutral" 0>
  <GND * 1 640 370 0 0 0 0>
  <L L3 1 710 260 -26 10 0 0 "10uH" 1 "" 0>
  <C C4 1 780 340 17 -26 0 1 "1.417nF" 1 "" 0 "neutral" 0>
  <GND * 1 780 370 0 0 0 0>
  <Pac P2 1 890 340 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 890 370 0 0 0 0>
  <.SP SP1 1 260 440 0 67 0 0 "log" 1 "100kHz" 1 "10MHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 480 450 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
</Components>
<Wires>
  <250 260 250 310 "" 0 0 0 "">
  <250 260 360 260 "" 0 0 0 "">
  <360 260 360 310 "" 0 0 0 "">
  <500 260 500 310 "" 0 0 0 "">
  <640 260 640 310 "" 0 0 0 "">
  <780 260 780 310 "" 0 0 0 "">
  <360 260 400 260 "" 0 0 0 "">
  <460 260 500 260 "" 0 0 0 "">
  <500 260 540 260 "" 0 0 0 "">
  <600 260 640 260 "" 0 0 0 "">
  <640 260 680 260 "" 0 0 0 "">
  <740 260 780 260 "" 0 0 0 "">
  <890 260 890 310 "" 0 0 0 "">
  <780 260 890 260 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 590 440 12 #000000 0 "Butterworth low-pass filter \n 1MHz cutoff, pi-type, \n impedance matching 50 Ohm">
</Paintings>
