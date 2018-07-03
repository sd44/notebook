# vim: set ft=perl:

## Latexmk configuration file.

# Use XeLaTeX to compile.
$pdf_mode = 5;

$clean_ext = 'thm glo gls bbl hd loe synctex.gz xdv run.xml';

$pdf_previewer = 'okular %O %S';
#$preview_continuous_mode = 1; # equivalent to -pvc 
$preview_mode = 1; # equivalent to -pv 

