@echo off
call env.bat

set W2L_PATH=C:\dev\software\writer2latex152a
set "lock=%temp%\wait%random%.lock"

start "" 9>"%lock%1" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 1_wstep.fodt tex/1_wstep
start "" 9>"%lock%2" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 2_analiza_wiedzy.fodt tex/2_analiza_wiedzy
start "" 9>"%lock%3" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 3_teoria_problemu.fodt tex/3_teoria_problemu
start "" 9>"%lock%4" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 4_praktyka_implementacja.fodt tex/4_praktyka_implementacja
start "" 9>"%lock%5" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 5_rezultaty_analiza.fodt tex/5_rezultaty_analiza
start "" 9>"%lock%6" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 6_zakonczenie_podsumowanie.fodt tex/6_zakonczenie_podsumowanie
:Wait for all processes to finish (wait until lock files are no longer locked)
1>nul 2>nul ping /n 2 ::1
for %%F in ("%lock%*") do (
  (call ) 9>"%%F" || goto :Wait
) 2>nul
del "%lock%*"



cd tex

perl porzadki.pl 1_wstep.tex > 1_wstep.tex.bak
perl porzadki.pl 2_analiza_wiedzy.tex > 2_analiza_wiedzy.tex.bak
perl porzadki.pl 3_teoria_problemu.tex > 3_teoria_problemu.tex.bak
perl porzadki.pl 4_praktyka_implementacja.tex > 4_praktyka_implementacja.tex.bak
perl porzadki.pl 5_rezultaty_analiza.tex > 5_rezultaty_analiza.tex.bak
perl porzadki.pl 6_zakonczenie_podsumowanie.tex > 6_zakonczenie_podsumowanie.tex.bak

rm 1_wstep.tex
rm 2_analiza_wiedzy.tex
rm 3_teoria_problemu.tex
rm 4_praktyka_implementacja.tex
rm 5_rezultaty_analiza.tex
rm 6_zakonczenie_podsumowanie.tex

mv 1_wstep.tex.bak 1_wstep.tex
mv 2_analiza_wiedzy.tex.bak 2_analiza_wiedzy.tex
mv 3_teoria_problemu.tex.bak 3_teoria_problemu.tex
mv 4_praktyka_implementacja.tex.bak 4_praktyka_implementacja.tex
mv 5_rezultaty_analiza.tex.bak 5_rezultaty_analiza.tex
mv 6_zakonczenie_podsumowanie.tex.bak 6_zakonczenie_podsumowanie.tex


:: zamiana cudzyslowiow na polskie

sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 1_wstep.tex
sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 2_analiza_wiedzy.tex
sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 3_teoria_problemu.tex
sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 4_praktyka_implementacja.tex
sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 5_rezultaty_analiza.tex
sed -i "s/\(.*\){\\\textquotedbl}\(.*\){\\\textquotedbl}\(.*\)/\1,,\2''\3/g" 6_zakonczenie_podsumowanie.tex


:: call _compile.bat

start /b /w /realtime pdflatex main.tex
start /b /w /realtime makeindex main.idx
start /b /w /realtime pdflatex main.tex

