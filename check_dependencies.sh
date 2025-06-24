#!/bin/bash
# Script de vérification des dépendances LaTeX
# Usage: ./check_dependencies.sh

echo "=============================================="
echo "  Vérification des dépendances LaTeX"
echo "  Template Rapport M1 - Spectroscopie THz"
echo "=============================================="

# Fonction de vérification
check_command() {
    if command -v "$1" &> /dev/null; then
        echo "✓ $1 trouvé"
        return 0
    else
        echo "✗ $1 NON trouvé"
        return 1
    fi
}

# Fonction de vérification de package LaTeX
check_package() {
    if kpsewhich "$1.sty" &> /dev/null; then
        echo "✓ Package $1 trouvé"
        return 0
    else
        echo "✗ Package $1 NON trouvé"
        return 1
    fi
}

echo
echo "=== Vérification des commandes de base ==="
missing_commands=0

check_command "pdflatex" || ((missing_commands++))
check_command "biber" || ((missing_commands++))
check_command "kpsewhich" || ((missing_commands++))

echo
echo "=== Vérification des packages essentiels ==="
missing_packages=0

# Packages de base
check_package "inputenc" || ((missing_packages++))
check_package "fontenc" || ((missing_packages++))
check_package "babel" || ((missing_packages++))
check_package "lmodern" || ((missing_packages++))

# Packages mathématiques
check_package "amsmath" || ((missing_packages++))
check_package "amssymb" || ((missing_packages++))
check_package "mathtools" || ((missing_packages++))

# Packages physique
check_package "siunitx" || ((missing_packages++))
check_package "physics" || ((missing_packages++))

# Packages graphiques
check_package "graphicx" || ((missing_packages++))
check_package "tikz" || ((missing_packages++))
check_package "pgfplots" || ((missing_packages++))

# Packages tableaux
check_package "booktabs" || ((missing_packages++))
check_package "tabularx" || ((missing_packages++))

# Packages bibliographie
check_package "biblatex" || ((missing_packages++))

# Packages mise en page
check_package "geometry" || ((missing_packages++))
check_package "fancyhdr" || ((missing_packages++))
check_package "titlesec" || ((missing_packages++))

# Packages couleurs et liens
check_package "xcolor" || ((missing_packages++))
check_package "hyperref" || ((missing_packages++))

echo
echo "=== Résumé ==="
if [ $missing_commands -eq 0 ] && [ $missing_packages -eq 0 ]; then
    echo "🎉 Toutes les dépendances sont présentes !"
    echo "   Vous pouvez compiler le rapport avec :"
    echo "   make pdf"
    echo "   ou"
    echo "   ./compile.bat (Windows)"
    exit 0
else
    echo "⚠️  Dépendances manquantes :"
    [ $missing_commands -gt 0 ] && echo "   - $missing_commands commande(s) manquante(s)"
    [ $missing_packages -gt 0 ] && echo "   - $missing_packages package(s) manquant(s)"
    echo
    echo "Solutions recommandées :"
    echo "   - Installer TeX Live complet : https://www.tug.org/texlive/"
    echo "   - Ou installer MiKTeX : https://miktex.org/"
    echo "   - Ou utiliser Overleaf en ligne : https://www.overleaf.com/"
    exit 1
fi