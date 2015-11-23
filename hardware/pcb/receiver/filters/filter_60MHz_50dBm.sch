<Qucs Schematic 0.0.19>
<Properties>
  <View=386,221,1211,698,1.81342,0,0>
  <Grid=10,10,1>
  <DataSet=filter.dat>
  <DataDisplay=filter.dpl>
  <OpenDisplay=1>
  <Script=filter.m>
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
  <Pac P1 1 440 420 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 440 450 0 0 0 0>
  <GND * 1 550 450 0 0 0 0>
  <L L1 1 620 305 -26 -44 0 0 "120nH" 1 "" 0>
  <GND * 1 690 450 0 0 0 0>
  <L L2 1 760 305 -26 -44 0 0 "68nH" 1 "" 0>
  <GND * 1 830 450 0 0 0 0>
  <L L3 1 900 305 -26 -44 0 0 "82nH" 1 "" 0>
  <GND * 1 970 450 0 0 0 0>
  <Pac P2 1 1080 420 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1080 450 0 0 0 0>
  <.SP SP1 1 450 500 0 64 0 0 "log" 1 "1Hz" 1 "100MHz" 1 "2000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 640 510 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C2 1 620 340 -26 10 0 0 "18pF" 1 "" 0 "neutral" 0>
  <C C4 1 760 340 -26 10 0 0 "91pF" 1 "" 0 "neutral" 0>
  <C C6 1 900 340 -26 10 0 0 "62pF" 1 "" 0 "neutral" 0>
  <C C7 1 970 420 17 -26 0 1 "68pF" 1 "" 0 "neutral" 0>
  <C C5 1 830 420 17 -26 0 1 "82pF" 1 "" 0 "neutral" 0>
  <C C3 1 690 420 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
  <C C1 1 550 420 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <440 340 440 390 "" 0 0 0 "">
  <440 340 550 340 "" 0 0 0 "">
  <550 340 550 390 "" 0 0 0 "">
  <550 340 590 340 "" 0 0 0 "">
  <650 340 690 340 "" 0 0 0 "">
  <590 305 590 340 "" 0 0 0 "">
  <650 305 650 340 "" 0 0 0 "">
  <690 340 690 390 "" 0 0 0 "">
  <690 340 730 340 "" 0 0 0 "">
  <790 340 830 340 "" 0 0 0 "">
  <730 305 730 340 "" 0 0 0 "">
  <790 305 790 340 "" 0 0 0 "">
  <830 340 830 390 "" 0 0 0 "">
  <830 340 870 340 "" 0 0 0 "">
  <930 340 970 340 "" 0 0 0 "">
  <870 305 870 340 "" 0 0 0 "">
  <930 305 930 340 "" 0 0 0 "">
  <970 340 970 390 "" 0 0 0 "">
  <1080 340 1080 390 "" 0 0 0 "">
  <970 340 1080 340 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 780 510 12 #000000 0 "Cauer low-pass filter\n60MHz cutoff, PI-type,\nimpedance matching 50 Ohm">
</Paintings>
