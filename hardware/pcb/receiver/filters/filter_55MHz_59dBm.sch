<Qucs Schematic 0.0.19>
<Properties>
  <View=336,431,1161,907,1.81723,0,0>
  <Grid=10,10,1>
  <DataSet=filter_55MHz_59dBm.dat>
  <DataDisplay=filter_55MHz_59dBm.dpl>
  <OpenDisplay=1>
  <Script=filter_55MHz_59dBm.m>
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
  <Pac P1 1 390 630 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 390 660 0 0 0 0>
  <GND * 1 500 660 0 0 0 0>
  <L L1 1 570 515 -26 -44 0 0 "150nH" 1 "" 0>
  <GND * 1 640 660 0 0 0 0>
  <GND * 1 780 660 0 0 0 0>
  <L L3 1 850 515 -26 -44 0 0 "100nH" 1 "" 0>
  <GND * 1 920 660 0 0 0 0>
  <Pac P2 1 1030 630 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1030 660 0 0 0 0>
  <.SP SP1 1 400 710 0 64 0 0 "log" 1 "1Hz" 1 "180MHz" 1 "2000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 590 720 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C2 1 570 550 -26 10 0 0 "12pF" 1 "" 0 "neutral" 0>
  <C C4 1 710 550 -26 10 0 0 "56pF" 1 "" 0 "neutral" 0>
  <C C6 1 850 550 -26 10 0 0 "39pF" 1 "" 0 "neutral" 0>
  <C C7 1 920 630 17 -26 0 1 "91pF" 1 "" 0 "neutral" 0>
  <C C5 1 780 630 17 -26 0 1 "110pF" 1 "" 0 "neutral" 0>
  <C C3 1 640 630 17 -26 0 1 "130pF" 1 "" 0 "neutral" 0>
  <C C1 1 500 630 17 -26 0 1 "110pF" 1 "" 0 "neutral" 0>
  <L L2 1 710 515 -26 -44 0 0 "100nH" 1 "" 0>
</Components>
<Wires>
  <390 550 390 600 "" 0 0 0 "">
  <390 550 500 550 "" 0 0 0 "">
  <500 550 500 600 "" 0 0 0 "">
  <500 550 540 550 "" 0 0 0 "">
  <600 550 640 550 "" 0 0 0 "">
  <540 515 540 550 "" 0 0 0 "">
  <600 515 600 550 "" 0 0 0 "">
  <640 550 640 600 "" 0 0 0 "">
  <640 550 680 550 "" 0 0 0 "">
  <740 550 780 550 "" 0 0 0 "">
  <780 550 780 600 "" 0 0 0 "">
  <780 550 820 550 "" 0 0 0 "">
  <880 550 920 550 "" 0 0 0 "">
  <820 515 820 550 "" 0 0 0 "">
  <880 515 880 550 "" 0 0 0 "">
  <920 550 920 600 "" 0 0 0 "">
  <1030 550 1030 600 "" 0 0 0 "">
  <920 550 1030 550 "" 0 0 0 "">
  <740 515 740 550 "" 0 0 0 "">
  <680 515 680 550 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 730 720 12 #000000 0 "Cauer low-pass filter\n55MHz cutoff, PI-type,\nimpedance matching 50 Ohm">
</Paintings>
