#! /usr/bin/perl
 

sub PoprawReszte{
	# Zmiany cudzyslowiow na polskie
	s/{\\textquotedbl}(.*){\\textquotedbl}/,,$1''/g;
	# Usuwa niepotrzebne naglowni formatowania list punktowanych z Writera
	s/\\liststyleLiii//g;
	s/\\liststyleLii//g;
	s/\\liststyleLi//g;
=for
	#naprawa nieprawidlowej konwersji znacznikow przez writer2latex
	s/{\\textbackslash}cite\\{(\w*)\\}/\\cite{$1}/g;
	s/{\\textbackslash}cite\[([^<]*)\]\\{(\w*)\\}/\\cite\[$1\]{$2}/g;

	s/{\\textbackslash}gls\\{(\w*)\\}/\\gls{$1}/g;

	s/{\\textbackslash}frontmatter/\\frontmatter/g;
	s/{\\textbackslash}mainmatter/\\mainmatter/g;
	s/{\\textbackslash}backmatter/\\backmatter/g;

	s/{\\textbackslash}url\\{(.*)\\}/\\url{$1}/g;
	s/{\\textbackslash}footnote\\{(.*)\\}/\\footnote{$1}/g;
	s/{\\textbackslash}ref\\{(.*)\\}/\\ref{$1}/g;

	s/{\\textbackslash}centering/\\centering/g;
	s/{\\textbackslash}textwidth/\\textwidth/g;

	s/{\\textbackslash}caption\\{(.*)\\}/\\caption{$1}/g;
	s/{\\textbackslash}label\\{(.*)\\}/\\label{$1}/g;
	#figure
	s/{\\textbackslash}begin\\{figure\\}/\\begin{figure}/g;
	s/{\\textbackslash}end\\{figure\\}/\\end{figure}/g;
	s/{\\textbackslash}includegraphics\[(.*)\]\\{(.*)\\}/\\includegraphics\[$1\]{$2}/g;
	s/{\\textbackslash}includesvg\[(.*)\]\\{([\w.]*)\\}/\\includesvg\[$1\]{$2}/g;

	s/{\\textbar}/|/g;

	s/{\\textbackslash}{\\textbackslash}/\\\\/g;

	s/{\\textbackslash}multirow\\{([0-9]*)\\}\\{(.*)\\}\\{(.*)\\}/\\multirow{$1}{$2}{$3}/g;

	s/{\\textbackslash}begin\\{table\\}/\\begin{table}/g;
	s/{\\textbackslash}end\\{table\\}/\\end{table}/g;
	s/{\\textbackslash}begin\\{tabular\\}\\{([a-zA-Z|]*)\\}/\\begin{tabular}{$1}/g;
	s/{\\textbackslash}end\\{tabular\\}/\\end{tabular}/g;
	s/{\\textbackslash}hline/\\hline/g;
	s/{\\textbackslash}newline/\\newline/g;
	s/{\\textbackslash}tabularnewline/\\tabularnewline/g;

	s/{\\textbackslash}input\\{(.*)\\}/\\input{$1}/g;

	s/\\&/&/g;
	s/\\%/%/g;
=cut

};
# ========================================================================
# Główny program

 
while (<>) {

	&PoprawReszte;
} continue { print; };
 
# Koniec skryptu "porzadki2".
