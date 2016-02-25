@echo off
call env.bat

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%
set "lock=%temp%\wait%random%.lock"



start /b /w /realtime java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml thesis.fodt tex/thesis

cd tex

start /b /w /realtime perl -i.bak porzadki.pl thesis.tex


:: call _compile.bat

start /b /w /realtime pdflatex main
start /b /w /realtime makeglossaries main
start /b /w /realtime bibtex main.aux
start /b /w /realtime pdflatex main
start /b /w /realtime pdflatex main


cd %RUNTIME%

