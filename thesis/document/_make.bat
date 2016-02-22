@echo off
call env.bat

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%
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

start "" 9>"%lock%1" /b /realtime perl -i.bak porzadki.pl 1_wstep.tex
start "" 9>"%lock%2" /b /realtime perl -i.bak porzadki.pl 2_analiza_wiedzy.tex
start "" 9>"%lock%3" /b /realtime perl -i.bak porzadki.pl 3_teoria_problemu.tex
start "" 9>"%lock%4" /b /realtime perl -i.bak porzadki.pl 4_praktyka_implementacja.tex
start "" 9>"%lock%5" /b /realtime perl -i.bak porzadki.pl 5_rezultaty_analiza.tex
start "" 9>"%lock%6" /b /realtime perl -i.bak porzadki.pl 6_zakonczenie_podsumowanie.tex

:Wait2 for all processes to finish (wait until lock files are no longer locked)
1>nul 2>nul ping /n 2 ::1
for %%F in ("%lock%*") do (
  (call ) 9>"%%F" || goto :Wait2
) 2>nul
del "%lock%*"


:: call _compile.bat

start /b /w /realtime pdflatex main.tex
start /b /w /realtime makeindex main.idx
start /b /w /realtime bibtex main.aux
start /b /w /realtime pdflatex main.tex
start /b /w /realtime pdflatex main.tex


cd %RUNTIME%

