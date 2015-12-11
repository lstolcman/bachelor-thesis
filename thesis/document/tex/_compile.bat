@echo off
call env.bat

del *.pdf

if "%1" == "" goto all
if "%1" == "all" goto all
if "%1" == "clean" goto clean
if "%1" == "cl" goto clean
if "%1" == "co" goto compile

:all
call :compile
goto eof

:clean
del *.aux
del *.log
del *.out
del *.snm
del *.toc
del *.lof
del *.nav
del *.ing
del *.lot
del *.ilg
goto eof

:compile
start /b /w /realtime pdflatex main.tex
start /b /w /realtime makeindex main.idx
start /b /w /realtime pdflatex main.tex
goto eof

:eof
