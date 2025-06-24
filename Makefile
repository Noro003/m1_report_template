# Makefile pour compilation LaTeX
# Rapport de Stage M1 - Spectroscopie THz

# Variables
MAIN = main
LATEX = pdflatex
BIBER = biber
VIEWER = evince

# Options de compilation
LATEX_OPTIONS = -interaction=nonstopmode -halt-on-error
BIBER_OPTIONS = --debug

# Fichiers temporaires à nettoyer
TEMP_FILES = *.aux *.log *.bbl *.blg *.bcf *.run.xml *.toc *.lof *.lot *.out *.fdb_latexmk *.fls *.nav *.snm *.vrb

# Compilation complète
all: pdf

# Compilation PDF avec bibliographie
pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	@echo "=== Compilation LaTeX (passe 1) ==="
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex
	@echo "=== Compilation bibliographie ==="
	$(BIBER) $(BIBER_OPTIONS) $(MAIN)
	@echo "=== Compilation LaTeX (passe 2) ==="
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex
	@echo "=== Compilation LaTeX (passe 3) ==="
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex
	@echo "=== Compilation terminée ==="

# Compilation rapide (sans bibliographie)
quick:
	@echo "=== Compilation rapide ==="
	$(LATEX) $(LATEX_OPTIONS) $(MAIN).tex

# Visualisation du PDF
view: $(MAIN).pdf
	$(VIEWER) $(MAIN).pdf &

# Nettoyage des fichiers temporaires
clean:
	@echo "=== Nettoyage des fichiers temporaires ==="
	rm -f $(TEMP_FILES)

# Nettoyage complet (y compris PDF)
distclean: clean
	@echo "=== Nettoyage complet ==="
	rm -f $(MAIN).pdf

# Compilation continue avec surveillance des fichiers
watch:
	@echo "=== Mode surveillance (Ctrl+C pour arrêter) ==="
	while inotifywait -e modify *.tex chapters/*.tex config/*.tex frontmatter/*.tex backmatter/*.tex; do \
		make quick; \
	done

# Vérification de la syntaxe
check:
	@echo "=== Vérification syntaxe LaTeX ==="
	$(LATEX) -draftmode -interaction=nonstopmode $(MAIN).tex

# Statistiques du document
stats: $(MAIN).pdf
	@echo "=== Statistiques du document ==="
	@echo "Pages: $$(pdfinfo $(MAIN).pdf | grep Pages | awk '{print $$2}')"
	@echo "Mots (approximatif): $$(pdftotext $(MAIN).pdf - | wc -w)"
	@echo "Caractères: $$(pdftotext $(MAIN).pdf - | wc -c)"

# Aide
help:
	@echo "=== Makefile - Rapport de Stage M1 ==="
	@echo "Commandes disponibles:"
	@echo "  make pdf      - Compilation complète avec bibliographie"
	@echo "  make quick    - Compilation rapide sans bibliographie"
	@echo "  make view     - Ouvrir le PDF dans le visualiseur"
	@echo "  make clean    - Supprimer fichiers temporaires"
	@echo "  make distclean- Nettoyage complet (+ PDF)"
	@echo "  make watch    - Compilation automatique lors de modifications"
	@echo "  make check    - Vérifier la syntaxe LaTeX"
	@echo "  make stats    - Afficher statistiques du document"
	@echo "  make help     - Afficher cette aide"

# Cibles qui ne sont pas des fichiers
.PHONY: all pdf quick view clean distclean watch check stats help