@echo off
call env.bat

:: inkscape needed for includesvg
set PATH=%PATH%;C:\dev\software\inkscape

del *.pdf

for /R "%cd%" %%f in (*.svg) do (
	inkscape "%%~nf.svg" -A "%%~nf_.pdf"
	pdfcrop "%%~nf_.pdf" "%%~nf.pdf"
	del "%%~nf_.pdf"
)

:::bash rm *.pdf;for f in *.svg; do echo `basename $f`; inkscape "$f" -A "${f%.svg}_.pdf";pdfcrop ${f%.svg}_.pdf ${f%.svg}.pdf; rm ${f%.svg}_ .pdf; don

