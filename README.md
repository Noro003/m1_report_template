# Template LaTeX - Rapport de Stage M1 Spectroscopie THz

Template LaTeX personnalisé pour rapport de stage Master 1 Physique et Applications, spécialement conçu pour le projet de spectroscopie THz sub-Doppler par photomélange à l'ISMO.

## 🎯 Objectif

Ce template fournit une structure complète et professionnelle pour rédiger un rapport de stage M1 de 30 pages maximum, suivant les standards académiques français et optimisé pour les contenus de physique/spectroscopie.

## 📁 Structure du projet

```
m1_report_template/
├── main.tex                    # Document principal
├── config/                     # Configuration et packages
│   ├── packages.tex           # Packages LaTeX
│   ├── layout.tex             # Mise en page
│   ├── french_settings.tex    # Paramètres français
│   ├── physics_settings.tex   # Macros physique/THz
│   └── metadata.tex           # Métadonnées du rapport
├── frontmatter/               # Pages préliminaires
│   ├── cover.tex             # Page de couverture
│   ├── title_page.tex        # Page de garde
│   ├── table_of_contents.tex # Sommaire
│   └── organization.tex      # Organisation du rapport
├── chapters/                  # Chapitres principaux
│   ├── 01_introduction_contexte.tex
│   ├── 02_protocoles_procedures.tex
│   ├── 03_resultats_attendus.tex
│   ├── 04_analyse_perspectives.tex
│   └── 05_conclusion.tex
├── backmatter/               # Pages finales
│   ├── bibliography.tex     # Bibliographie
│   ├── bibliography.bib     # Fichier bibliographique
│   └── back_cover.tex       # Quatrième de couverture
├── figures/                  # Répertoire des figures
└── README.md                # Ce fichier
```

## 🚀 Utilisation rapide

### 1. Personnalisation des métadonnées

Éditez `config/metadata.tex` pour adapter le template à votre stage :

```latex
% Informations étudiant
\newcommand{\studentname}{Votre Nom Prénom}
\newcommand{\studentnumber}{Votre numéro étudiant}
\newcommand{\studentemail}{votre.email@etudiant.fr}

% Informations stage
\newcommand{\supervisor}{Nom de votre encadrant}
\newcommand{\supervisoremail}{encadrant@cnrs.fr}
% ... etc
```

### 2. Compilation

```bash
# Compilation complète avec bibliographie
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex

# Ou utilisation du Makefile
make pdf
```

### 3. Personnalisation du contenu

1. **Remplacez les sections `\lipsum`** dans les chapitres par votre contenu réel
2. **Ajoutez vos figures** dans le répertoire `figures/`
3. **Complétez la bibliographie** dans `backmatter/bibliography.bib`
4. **Adaptez les résumés** français/anglais dans `config/metadata.tex`

## 📝 Caractéristiques du template

### Structure selon plan approuvé
- **Pages obligatoires** (4p) : couverture, garde, sommaire, organisation
- **Corps du rapport** (22p) : 5 chapitres structurés
- **Pages finales** (4p) : bibliographie, quatrième de couverture

### Optimisé pour la physique
- **Packages spécialisés** : `siunitx`, `physics`, `amsmath`, `pgfplots`
- **Macros THz** : fréquences, lasers DFB, photomélange, etc.
- **Unités SI** : configuration française avec unités THz spécialisées
- **Équations** : environnements personnalisés pour équations importantes

### Typographie française
- **Configuration babel** : espacement, guillemets, ponctuation
- **Références croisées** : "figure 1", "chapitre 2", etc.
- **Bibliographie** : style numérique français avec biblatex

### Fonctionnalités avancées
- **Environnements colorés** : résultats clés, remarques, équations importantes
- **Navigation** : liens hypertexte, marque-pages PDF
- **Code source** : coloration syntaxique avec `listings`
- **Graphiques** : support TikZ et pgfplots

## 🎨 Personnalisation

### Couleurs principales
Le template utilise `NavyBlue` comme couleur principale. Modifiez dans `config/layout.tex` :

```latex
% Changement de couleur principale
\titleformat{\chapter}
{\normalfont\huge\bfseries\color{OliveGreen}}  % Nouvelle couleur
```

### Ajout de macros physiques
Ajoutez vos macros spécialisées dans `config/physics_settings.tex` :

```latex
% Vos macros spécifiques
\newcommand{\votreMacro}{\ensuremath{\text{Notation}}}
```

### Environnements personnalisés
Le template inclut des environnements prêts à l'emploi :

```latex
\begin{keyresult}
Résultat important à mettre en évidence
\end{keyresult}

\begin{remark}
Remarque technique
\end{remark}

\begin{importantequation}
E = mc^2
\end{importantequation}
```

## 📊 Figures et tableaux

### Figures
```latex
\begin{figure}[ht]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/mon_schema.pdf}
    \caption{Description de la figure}
    \label{fig:mon_schema}
\end{figure}
```

### Tableaux professionnels
```latex
\begin{table}[ht]
    \centering
    \caption{Description du tableau}
    \label{tab:mes_donnees}
    \begin{tabular}{lcc}
        \toprule
        \textbf{Paramètre} & \textbf{Valeur} & \textbf{Unité} \\
        \midrule
        Fréquence & 1.2 & \SI{}{\THz} \\
        Puissance & 5.3 & \SI{}{\milli\watt} \\
        \bottomrule
    \end{tabular}
\end{table}
```

## 🔧 Dépendances et compilation

### Packages requis
- **LaTeX de base** : TeX Live 2020+ ou MiKTeX
- **Biber** : pour la bibliographie
- **Packages spéciaux** : `siunitx`, `physics`, `pgfplots`, `tikz`, `biblatex`

### Compilation recommandée
```bash
# Workflow complet
pdflatex main.tex    # Première passe
biber main           # Bibliographie  
pdflatex main.tex    # Deuxième passe
pdflatex main.tex    # Finalisation
```

### Problèmes courants
- **Erreur biber** : vérifiez que `biber` est installé et dans le PATH
- **Packages manquants** : installez via votre distribution TeX
- **Figures manquantes** : vérifiez les chemins dans `figures/`

## 📖 Aide et support

### Documentation LaTeX
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [CTAN Package Repository](https://ctan.org/)

### Packages spécialisés
- [`siunitx`](https://ctan.org/pkg/siunitx) : unités SI
- [`physics`](https://ctan.org/pkg/physics) : notation physique
- [`biblatex`](https://ctan.org/pkg/biblatex) : bibliographie avancée
- [`pgfplots`](https://ctan.org/pkg/pgfplots) : graphiques scientifiques

## 🎓 Adaptation à d'autres projets

Ce template peut être adapté pour d'autres rapports de stage M1/M2 :

1. **Modifiez** `config/metadata.tex` avec vos informations
2. **Adaptez** `config/physics_settings.tex` à votre domaine
3. **Restructurez** les chapitres selon vos besoins
4. **Personnalisez** les couleurs et la mise en page

## 📄 Licence

Template libre d'utilisation pour projets académiques et de recherche.

---

**Créé pour :** Rapport de Stage M1 - Spectroscopie THz ISMO  
**Version :** 1.0  
**Dernière mise à jour :** Juin 2025