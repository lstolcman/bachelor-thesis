@echo off
call env.bat

:: inkscape needed for includesvg
set PATH=%PATH%;C:\dev\software\inkscape

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%

java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml thesis.fodt tex/thesis

cd tex

perl -i.bak porzadki.pl thesis.tex
perl porzadki.pl glossary.tex > glossary_plfixed.tex

pdflatex --shell-escape main
makeglossaries main
bibtex main.aux
pdflatex --shell-escape main
pdflatex --shell-escape main


cd %RUNTIME%

