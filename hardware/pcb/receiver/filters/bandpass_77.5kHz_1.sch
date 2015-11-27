<Qucs Schematic 0.0.19>
<Properties>
  <View=206,246,1071,713,1.83237,0,0>
  <Grid=10,10,1>
  <DataSet=bandpass_77.5kHz_1.dat>
  <DataDisplay=bandpass_77.5kHz_1.dpl>
  <OpenDisplay=1>
  <Script=bandpass_77.5kHz_1.m>
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
  <Pac P1 1 260 410 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 260 440 0 0 0 0>
  <L L1 1 410 410 8 -26 0 1 "120uH" 1 "" 0>
  <GND * 1 410 440 0 0 0 0>
  <L L2 1 520 330 -26 -44 0 0 "240uH" 1 "" 0>
  <L L3 1 550 410 8 -26 0 1 "30uH" 1 "" 0>
  <GND * 1 550 440 0 0 0 0>
  <L L4 1 660 330 -26 -44 0 0 "390uH" 1 "" 0>
  <L L5 1 690 410 8 -26 0 1 "30uH" 1 "" 0>
  <GND * 1 690 440 0 0 0 0>
  <L L6 1 800 330 -26 -44 0 0 "240uH" 1 "" 0>
  <L L7 1 830 410 8 -26 0 1 "120uH" 1 "" 0>
  <GND * 1 830 440 0 0 0 0>
  <Pac P2 1 940 410 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 940 440 0 0 0 0>
  <.SP SP1 1 310 510 0 67 0 0 "log" 1 "10kHz" 1 "450kHz" 1 "2000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 530 520 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C1 1 380 410 -8 46 0 1 "36nF" 1 "" 0 "neutral" 0>
  <C C7 1 800 410 -8 46 0 1 "36nF" 1 "" 0 "neutral" 0>
  <C C3 1 520 410 -8 46 0 1 "140nF" 1 "" 0 "neutral" 0>
  <C C5 1 660 410 -8 46 0 1 "140nF" 1 "" 0 "neutral" 0>
  <C C6 1 740 330 -26 10 0 0 "18nF" 1 "" 0 "neutral" 0>
  <C C4 1 600 330 -26 10 0 0 "10nF" 1 "" 0 "neutral" 0>
  <C C2 1 460 330 -26 10 0 0 "18nF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <260 330 260 380 "" 0 0 0 "">
  <260 330 410 330 "" 0 0 0 "">
  <410 330 410 380 "" 0 0 0 "">
  <550 330 550 380 "" 0 0 0 "">
  <690 330 690 380 "" 0 0 0 "">
  <830 330 830 380 "" 0 0 0 "">
  <410 330 430 330 "" 0 0 0 "">
  <380 380 410 380 "" 0 0 0 "">
  <380 440 410 440 "" 0 0 0 "">
  <550 330 570 330 "" 0 0 0 "">
  <520 380 550 380 "" 0 0 0 "">
  <520 440 550 440 "" 0 0 0 "">
  <690 330 710 330 "" 0 0 0 "">
  <660 380 690 380 "" 0 0 0 "">
  <660 440 690 440 "" 0 0 0 "">
  <800 380 830 380 "" 0 0 0 "">
  <800 440 830 440 "" 0 0 0 "">
  <940 330 940 380 "" 0 0 0 "">
  <830 330 940 330 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 640 510 12 #000000 0 "Butterworth band-pass filter \n 60kHz...100kHz, pi-type, \n impedance matching 50 Ohm\n7th order">
</Paintings>
