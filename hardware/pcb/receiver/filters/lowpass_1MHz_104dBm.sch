<Qucs Schematic 0.0.19>
<Properties>
  <View=146,191,971,667,1.81723,0,0>
  <Grid=10,10,1>
  <DataSet=lowpass_1MHz_104dBm.dat>
  <DataDisplay=lowpass_1MHz_104dBm.dpl>
  <OpenDisplay=1>
  <Script=lowpass_1MHz_104dBm.m>
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
  <Pac P1 1 220 400 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 220 430 0 0 0 0>
  <GND * 1 330 430 0 0 0 0>
  <L L1 1 400 285 -26 -44 0 0 "10uH" 1 "" 0>
  <GND * 1 470 430 0 0 0 0>
  <L L2 1 540 285 -26 -44 0 0 "10uH" 1 "" 0>
  <GND * 1 610 430 0 0 0 0>
  <L L3 1 680 285 -26 -44 0 0 "10uH" 1 "" 0>
  <GND * 1 750 430 0 0 0 0>
  <Pac P2 1 860 400 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 860 430 0 0 0 0>
  <.SP SP1 1 230 480 0 64 0 0 "log" 1 "1Hz" 1 "3MHz" 1 "2000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 420 490 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C2 1 400 320 -26 10 0 0 "130pF" 1 "" 0 "neutral" 0>
  <C C4 1 540 320 -26 10 0 0 "620pF" 1 "" 0 "neutral" 0>
  <C C1 1 330 400 17 -26 0 1 "5100pF" 1 "" 0 "neutral" 0>
  <C C7 1 750 400 17 -26 0 1 "5100pF" 1 "" 0 "neutral" 0>
  <C C3 1 470 400 17 -26 0 1 "7500pF" 1 "" 0 "neutral" 0>
  <C C5 1 610 400 17 -26 0 1 "7500pF" 1 "" 0 "neutral" 0>
  <C C6 1 680 320 -26 10 0 0 "430pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <220 320 220 370 "" 0 0 0 "">
  <220 320 330 320 "" 0 0 0 "">
  <330 320 330 370 "" 0 0 0 "">
  <330 320 370 320 "" 0 0 0 "">
  <430 320 470 320 "" 0 0 0 "">
  <370 285 370 320 "" 0 0 0 "">
  <430 285 430 320 "" 0 0 0 "">
  <470 320 470 370 "" 0 0 0 "">
  <470 320 510 320 "" 0 0 0 "">
  <570 320 610 320 "" 0 0 0 "">
  <510 285 510 320 "" 0 0 0 "">
  <570 285 570 320 "" 0 0 0 "">
  <610 320 610 370 "" 0 0 0 "">
  <610 320 650 320 "" 0 0 0 "">
  <710 320 750 320 "" 0 0 0 "">
  <650 285 650 320 "" 0 0 0 "">
  <710 285 710 320 "" 0 0 0 "">
  <750 320 750 370 "" 0 0 0 "">
  <860 320 860 370 "" 0 0 0 "">
  <750 320 860 320 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 560 490 12 #000000 0 "Cauer low-pass filter\n1MHz cutoff, PI-type,\nimpedance matching 50 Ohm">
</Paintings>
