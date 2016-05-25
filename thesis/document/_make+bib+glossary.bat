@echo off
call env.bat

cd tex
call _clean_all
cd ..

:: inkscape needed for includesvg
set PATH=%PATH%;C:\dev\software\inkscape

set W2L_PATH=C:\dev\software\writer2latex152a
set RUNTIME=%cd%

java -jar %W2L_PATH%\writer2latex.jar -backend pdftex -config mycfg.xml thesis.fodt tex/thesis

cd tex

perl -i.bak pporzadki2.pl thesis.tex
perl porzadki.pl thesis.tex > thesis_plfixed.tex
perl porzadki.pl glossary.tex > glossary_plfixed.tex

pdflatex main
makeglossaries main
bibtex main.aux
pdflatex main
pdflatex main

rem stat -c "%%z" main.pdf | gdate "+%%Y-%%m-%%d_%%H-%%M" > tmpFile
rem set /p mvmain= <tmpFile
rem cp main.pdf %mvmain%.pdf
rem rm tmpFile

cd %RUNTIME%

