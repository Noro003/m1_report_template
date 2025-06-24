@echo off
REM Script de compilation Windows pour rapport M1
REM Usage: double-cliquer ou executer depuis cmd

echo ===============================================
echo   Compilation Rapport de Stage M1 - THz
echo ===============================================

REM Vérification que pdflatex est disponible
where pdflatex >nul 2>nul
if %errorlevel% neq 0 (
    echo ERREUR: pdflatex non trouve dans le PATH
    echo Verifiez votre installation LaTeX
    pause
    exit /b 1
)

REM Vérification que biber est disponible
where biber >nul 2>nul
if %errorlevel% neq 0 (
    echo ERREUR: biber non trouve dans le PATH
    echo Verifiez votre installation LaTeX
    pause
    exit /b 1
)

echo.
echo === Compilation LaTeX (passe 1) ===
pdflatex -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ERREUR lors de la compilation LaTeX (passe 1)
    pause
    exit /b 1
)

echo.
echo === Compilation bibliographie ===
biber main
if %errorlevel% neq 0 (
    echo ERREUR lors de la compilation bibliographie
    pause
    exit /b 1
)

echo.
echo === Compilation LaTeX (passe 2) ===
pdflatex -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ERREUR lors de la compilation LaTeX (passe 2)
    pause
    exit /b 1
)

echo.
echo === Compilation LaTeX (passe 3) ===
pdflatex -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ERREUR lors de la compilation LaTeX (passe 3)
    pause
    exit /b 1
)

echo.
echo ===============================================
echo   COMPILATION REUSSIE !
echo   Fichier genere: main.pdf
echo ===============================================

REM Ouverture automatique du PDF
if exist main.pdf (
    echo Ouverture du PDF...
    start main.pdf
) else (
    echo ATTENTION: main.pdf non trouve
)

echo.
echo Appuyez sur une touche pour continuer...
pause >nul