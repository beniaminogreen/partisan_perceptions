report.pdf: report.Rmd data/models.Rdata
	R -e "require(rmarkdown); render('report.Rmd')"

data/models.Rdata: scripts/estimate_models.R
	R CMD BATCH scripts/estimate_models.R

clean:
	rm -f *.html *.pdf *.tex *.aux *.log *.docx *.Rout
