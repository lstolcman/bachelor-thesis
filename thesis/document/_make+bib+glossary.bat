@echo off
call env.bat

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%
set "lock=%temp%\wait%random%.lock"



start "" 9>"%lock%1" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 0_wstep.fodt tex/0_wstep
start "" 9>"%lock%2" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 0_zakonczenie.fodt tex/0_zakonczenie
start "" 9>"%lock%3" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 0_todo.fodt tex/0_todo
start "" 9>"%lock%4" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 1.fodt tex/1
start "" 9>"%lock%5" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 2.fodt tex/2
start "" 9>"%lock%6" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 3.fodt tex/3
start "" 9>"%lock%7" /b /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml 4.fodt tex/4

:Wait for all processes to finish (wait until lock files are no longer locked)
1>nul 2>nul ping /n 2 ::1
for %%F in ("%lock%*") do (
  (call ) 9>"%%F" || goto :Wait
) 2>nul
del "%lock%*"



cd tex

start "" 9>"%lock%1" /b /realtime perl -i.bak porzadki.pl 0_wstep.tex
start "" 9>"%lock%2" /b /realtime perl -i.bak porzadki.pl 0_zakonczenie.tex
start "" 9>"%lock%3" /b /realtime perl -i.bak porzadki.pl 0_todo.tex
start "" 9>"%lock%4" /b /realtime perl -i.bak porzadki.pl 1.tex
start "" 9>"%lock%5" /b /realtime perl -i.bak porzadki.pl 2.tex
start "" 9>"%lock%6" /b /realtime perl -i.bak porzadki.pl 3.tex
start "" 9>"%lock%7" /b /realtime perl -i.bak porzadki.pl 4.tex

:Wait2 for all processes to finish (wait until lock files are no longer locked)
1>nul 2>nul ping /n 2 ::1
for %%F in ("%lock%*") do (
  (call ) 9>"%%F" || goto :Wait2
) 2>nul
del "%lock%*"


:: call _compile.bat

start /b /w /realtime pdflatex main
start /b /w /realtime makeglossaries main
start /b /w /realtime bibtex main.aux
start /b /w /realtime pdflatex main
start /b /w /realtime pdflatex main


cd %RUNTIME%

