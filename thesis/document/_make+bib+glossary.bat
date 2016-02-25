@echo off
call env.bat

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%

java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml thesis.fodt tex/thesis

cd tex

perl -i.bak porzadki.pl thesis.tex

pdflatex main
makeglossaries main
bibtex main.aux
pdflatex main
pdflatex main


cd %RUNTIME%

