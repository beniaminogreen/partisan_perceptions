report.pdf: report.Rmd data/*
	R -e "require(rmarkdown); sessionInfo(); render('report.Rmd')"

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx *.Rout
