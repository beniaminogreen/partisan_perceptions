report.pdf: report.Rmd data/*
	R -e "require(rmarkdown); render('report.Rmd')"

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx *.Rout
