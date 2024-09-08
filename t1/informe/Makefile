# Documento principal
MAIN = main.tex

# Directorio para figuras
FIGDIR = figs

# Directorio para cada sección
SECDIR = secciones

# PDF
OUTPUT = $(MAIN:.tex=.pdf)

# Compilador y opciones
LATEXMK = @latexmk
LATEXMK_OPTS = -shell-escape -silent -verbose -file-line-error -synctex=1 -interaction=nonstopmode 

# Opciones para compilación silenciosa
LATEX_SILENT = pdflatex -halt-on-error -interaction=batchmode -shell-escape -file-line-error >/dev/null

# Extensiones de binarios
CLEAN_EXTS = *.aux *.bbl *.blg *.idx *.ind *.lof *.log *.lot *.out *.toc *.acn *.acr *.alg *.glg *.glo *.gls *.ist *.fls *.fdb_latexmk *.synctex.gz $(OUTPUT)

# Caché de minted
MINTED_DIR = _minted-main

.PHONY: all clean cleanpdf

# Target por defecto
all: $(OUTPUT)

# Regla para compilar el proyecto con latexmk
$(OUTPUT): $(MAIN) $(FIGDIR)/*.tex $(FIGDIR)/*.png $(SECDIR)/*.tex preambulo.sty hdrftr.tex tikzset.tex
	$(LATEXMK) $(LATEXMK_OPTS) -pdflatex="$(LATEX_SILENT)" -pdf $(MAIN) >/dev/null

# Limpieza
clean:
	$(LATEXMK) -c
	@rm -f $(CLEAN_EXTS)
	@rm -rf $(MINTED_DIR)
